Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F9ECAC587
	for <ath12k@archiver.kernel.org>; Thu, 11 Sep 2025 14:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=917gDTnBHU88iGLp167tmwoiOYooMYFMtFjF2sGtBjA=; b=e2l88M6XLRKqpRCDnfykoi8WJ6
	BjWJZ9F8g1PvJfy22olq3oGURkWtNiaH9EE9gfxEeZM51XSPTdpHLrK1DZBg67B8AfbwrbJSjKPnP
	PGyFofISOLnDAf1XCY9SHTBn7iAMDxyX5rJeuWOYwvujxiWS5Wg203x3Q0x95nrzWBFwM3rGMWUyh
	aRutXUhDY2rpV0Vb0LT2UIlCwiWienz6A8fTVCjkEsLdpm7zElEApY+e3maJ95OhwNjLokZwEVqfC
	8RnBVP1+UeDBNaVLZyNYZNdcZdZh6m6FaT/PQfGqzOT4YeMzKgbjOvsO1mFOxRKGo9MWueiqgrdlc
	TJtKC0sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwiJt-00000003Ypv-0X7W;
	Thu, 11 Sep 2025 14:30:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwiJq-00000003Yor-2H7G
	for ath12k@lists.infradead.org;
	Thu, 11 Sep 2025 14:30:39 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BDXqck001937
	for <ath12k@lists.infradead.org>; Thu, 11 Sep 2025 14:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	917gDTnBHU88iGLp167tmwoiOYooMYFMtFjF2sGtBjA=; b=hMbJ+CfEQDEyxtbk
	vw3luaubDoRkwzVRT5XFrI12Y1ij1sTmrGJneE20DMuacPTWWx7IEn6vRnSy0OUb
	ZghRieUYu/oaRgpWl51gAYaKAeS2+PtoZS3pxcDId6DyXzyoG13+ce75EriXrDto
	229dguJOEhs8kGayZfCW5kdnmF//DlVt9cpunlZ+wJK3tBjOS58aDjnwDronznD0
	b5RgO/tFGDnhxfvFHOC+nKke94Ob14wwCfbikOEgBYBHrumLJh0/otCJPpqvM1zZ
	eF6Bag6bCnX85DUvidAuynLSkxxv66cuygbhVvnLXd2/uytY6tO99tF83xUpTBJr
	aUNzSQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493ydv0860-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 11 Sep 2025 14:30:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-25177b75e38so9709085ad.0
        for <ath12k@lists.infradead.org>; Thu, 11 Sep 2025 07:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757601036; x=1758205836;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=917gDTnBHU88iGLp167tmwoiOYooMYFMtFjF2sGtBjA=;
        b=sboP/gqYvVxTgGzOMFGjckIINYxdPTKhnTmGugcF2GclT9Ad81bMZDsIh7gIX6lvBi
         vl5k1aYtlsMh/jKpChdsOYPCDpUqyA3G+1ZLWk8VfPabz41I4jQ0ex9uVtDVbpEpOo+O
         Vw3h6PU/GRf40ohgGlCdyHb7QCti+qzt6m7iGgaWJxcml/ogPyKUyqHBP4ewC2rF/Kby
         khZck5vo3kcbB/JKu/KzhgY5sx80DepLB/1olphMY4gbLstiUaOvSDOxRxxDKvpStArE
         rfrB3XsC5H2ZruH8wMCFe9HKffyQbXUz2CypLWvkklb1fVCDXvaP6GI/ZIvsH83SeViS
         N2+Q==
X-Gm-Message-State: AOJu0YwxlCL3DTF5imQSZTVpaxy1NBWPGxR95hqs31eVO72HvqseQumK
	Iut+mG6PYIcA7OM9Swb+pJW8/kfLuuBkV3pwQIO0DP3Ys1U98gd+r8Wouh5nzzw9pck4AFcYFNg
	UfFEtidytoexHJj5izWKow6KlffQDZQgJGflk+RwacY9YEtVLozoBiBTdzZT42COh6jcgQqt1
X-Gm-Gg: ASbGncs9Y+IIDcPeldWv5kko6tJOCaMZM9FprKBHRjJpVHrw1xIclVkURezm9pTjYmc
	kanhAZIkFTUj0cpe0MPdxw/r5scH6U73Hw37nH7d1/uInZKbS0CU+Bd+DFFksquAQ8b543mDV1t
	VfPF+IaPqfl1UcgQ+7XENxtiineEaoQLtXwKUJBbYxl5ZT4WTBAs59scG8psHKhWdFo3FltYFQ7
	7FefWPhxXWj1qOL6FoEmWVH1/5mqq0otIk8pr0yGkBHjRm+tTduWbBDN+AN+0i60PRqnuprc9hD
	sOu0AXS3mRkkov4QO3F6+zqqASgdnvnKkbMhdRUR7vwn0kVkyV6GA+6C5XUg9jm57hmP/Q+JdXZ
	7
X-Received: by 2002:a17:902:d54a:b0:24f:b709:b672 with SMTP id d9443c01a7336-2516da06c7cmr283722305ad.19.1757601035787;
        Thu, 11 Sep 2025 07:30:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzbzBqCoOLdeU7wClgVCgXMwMsiKCXRcckprY9oDdGDKKA9FGzvR3OnY9fmZAmhbzB8iBZ6A==
X-Received: by 2002:a17:902:d54a:b0:24f:b709:b672 with SMTP id d9443c01a7336-2516da06c7cmr283721845ad.19.1757601035101;
        Thu, 11 Sep 2025 07:30:35 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3a84a80asm21429295ad.90.2025.09.11.07.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 07:30:34 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Ripan Deuri <quic_rdeuri@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250910181414.2062280-1-quic_rdeuri@quicinc.com>
References: <20250910181414.2062280-1-quic_rdeuri@quicinc.com>
Subject: Re: [PATCH ath12k-ng v2 0/8] wifi: ath12k: Improve hal APIs usage
 in rx path
Message-Id: <175760103448.2463901.17905370001690741334.b4-ty@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 07:30:34 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDEyMCBTYWx0ZWRfX+FYDIUM9SfVz
 BZXxEiDwfSqxbY9ktTSpQvTdRNZ5qYCplIYzkWM7pPTkFI7lu3uXJWkuU3HN1gxt/sO1sbRIGrF
 r2k07n6by7MyQF11bZOOyMYtrdXNAaq4DCNVW9pTDNM/fO9BDR/LrrOrHBbt1SZPpKvLxuBFC4M
 a8Z+6/TwoPW1O3LMTcTavZEmBeVWlo3MPrepp4//H/gNebgMkOzYS3ohvdIEv/gQ9fsENGTMZfo
 Rz9cjUV6IPM54E7JZJ6le75ClSZLPEwY7EVVu1tL5h4pnLd7d5Bf8Cj1iFHswpDuhpMT5N/o3T+
 tmovizJEnGU/hI73C6su5LDVzn2YbqVxLcqcN2haKms1IyBX+nAyj75ZT2nPugxTx0fHG1sCw1a
 aiPjOQQT
X-Proofpoint-GUID: bDWQqVaAF6o5grIuPpwGD-2TBuoR2Ed4
X-Proofpoint-ORIG-GUID: bDWQqVaAF6o5grIuPpwGD-2TBuoR2Ed4
X-Authority-Analysis: v=2.4 cv=LoaSymdc c=1 sm=1 tr=0 ts=68c2dd0d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=TeeMK1CGbMXA9tsS81oA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509110120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_073038_706931_B0D5CE0D 
X-CRM114-Status: GOOD (  10.70  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org


On Wed, 10 Sep 2025 23:44:06 +0530, Ripan Deuri wrote:
> The existing usage of rx_ops to reach the hal_apis at multiple places uses
> function pointer indirections. In order to avoid such multiple function
> pointer indirection, extract the required hal parameters in the rx path
> right at the beginning and store them in a structure which is then
> leveraged by the rest of the rx path.
> 
> Move remaining rx_ops APIs to hal_ops to simplify hal API usage.
> 
> [...]

Applied, thanks!

[1/8] wifi: ath12k: Remove non-compact TLV support from QCN
      commit: 00139e4d7baf41e05b907846dbc53829421bb1fc
[2/8] wifi: ath12k: Move the hal APIs to hardware specific files
      commit: 4ae34800a70d2704ec3a55146c86c4355a4129f6
[3/8] wifi: ath12k: unify HAL ops naming across chips
      commit: dd33e179466e4c0c5f74ebd838eedd9212cd3964
[4/8] wifi: ath12k: Replace ops with direct calls for rxdma ring mask
      commit: 52537339693789f3dd4ef7931f417ad641ee864b
[5/8] wifi: ath12k: Move hal_rx_ops callbacks to hal_ops
      commit: 92541061a6fd4e6a0acd700e8544cb26f19570e8
[6/8] wifi: ath12k: Add new infra for the rx path
      commit: e8a1e49c63280e6266392cb4a9f879e22bad893a
[7/8] wifi: ath12k: Remove hal_rx_ops and merge into hal_ops
      commit: 0cdb09b19760f3464b3fbed782b59758124537c3
[8/8] wifi: ath12k: Change the API prefixes to ath12k_wifi7 in tx/rx
      commit: 972f34d54015a4a16aa9e6a081bafabb6f9bf95c

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


