Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EA2C021B8
	for <ath12k@archiver.kernel.org>; Wed, 26 Feb 2025 18:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MLX0Q2dEhZ9snK7anZeDvn6rpn475XVQphjBDwoTus=; b=MwyrTl/uvfAIit6XkpeW/5b1KN
	4usg05t9PzFTRLstGIUVU3FJTSkfU0vCR8gtTM+tJ+UxP4giJzw+pnoULjo+NG9GHHmWd6axO9uh/
	jt3KP6v8KFlojEQo0RrNSxxdEdVGc/nA55nrw7b7ONzb2PbA7gCNMjE54D6d+WuMD/rDgliWUq+aC
	WGyB7oJf5H13t69jazNy6P29Sk8gn2EtoIVRSv7x3k4yEJ9Z/z9u6XD1Bi+rM2/i59CD5m0t3OQUu
	OhpX/TmMt6movd//eO2TMbKxukj1os91mdMJGB1Rl3nXdGrxBp+s0NolBxz5yUdI9Dhr97owMvCB7
	l+wzw1tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMSP-000000051q8-1k2d
	for ath12k@archiver.kernel.org;
	Wed, 26 Feb 2025 18:48:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMSM-000000051nZ-33I2
	for ath12k@lists.infradead.org;
	Wed, 26 Feb 2025 18:48:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q9p19v021802
	for <ath12k@lists.infradead.org>; Wed, 26 Feb 2025 18:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6MLX0Q2dEhZ9snK7anZeDvn6rpn475XVQphjBDwoTus=; b=AsvBCorau3gfAbbC
	8JLHXkXGZyh9uod1rSTe4VhpGCOhHOS+eVZ+g8UdYcodMPHN2NMcCNzG+jjCj3HA
	SoGcVdB8W4/ZSdHBKj+X+1fOkxRQDuAV011EWuCzD4O/PcmpojAEQ/zWXPCDCL3i
	BkeRNYGd2Nj+DYXWkDjNuqc0qF6Wyr35eMqvoEDnjtNCPf4ZXu0KuGX/HAeKm3M7
	vDFNhoo43mTmCHrdfrnVA7sQ+6jEORPwvFBOuyGfrlE9z98TzfETDcfCma2cVJBL
	YmYKN8W3teWVQt2A6mgSi+TnYrxHBELkd5ewB3Iba4ffp11Bi5HOnP2PqEyIfnNJ
	YEh2cQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prkk0cb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 26 Feb 2025 18:48:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2234dddbd6fso64255ad.0
        for <ath12k@lists.infradead.org>; Wed, 26 Feb 2025 10:48:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740595707; x=1741200507;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MLX0Q2dEhZ9snK7anZeDvn6rpn475XVQphjBDwoTus=;
        b=Eh6wFEk/RIKoVBakF1wTL1zwCUPcWQlZ4Y6U1WIdH3VsI15EB3F9rJTK+8U+cPIk3h
         MRZhH6cRbG/LMDy+JqGJ0C66/5rZO7HpYK8xqC4q2mD+5vE7FBXjX+U2df6h7QgzzeSG
         ppbdwUv/vTT3teIVvuggpZyBrNAAFsk9cBXDp6sNB9RoRF5RZCSdPBAQ/0UqDo9R8blU
         +uwvbjkrxWIdo6DlcQipAhPBpL67lJM1D8oZlXZU4QlnkNIFbUhnKmbG0766vnE2DQlh
         Fv/tqdAR6VNpdCGMXNITaLy8mPnM+97KM3XHzmMTQooce8oRID9n6ocQCrAwghDjjWlj
         um3w==
X-Gm-Message-State: AOJu0Yxmot6hIcV1Nn5dpGq17nHXFsjM8NYQWgS7DV9T91rATXUOFnyt
	Qtg+9Kq+6apdN0/E5VsdcbCmBp+h/N1zTjisE+wsouArBRGRp5hDxXtEXznLmrFnP4BpFgCnbgL
	8D/pImwq9YTsmyNO4trblvJDNh9ZGXJJ/zETuEpAnKmqMPge5cOe2GVAJS99y
X-Gm-Gg: ASbGnctLtdnnUeeP/QkIJ/cmC0ijD0Dfr4chBiFWBa+awvHUd/FKGX+8KjTpU7UFkjp
	B2mDhmv7k/DCFuFsTxinBW0dx2NPyt7C8uBt+IkUHQtaFrZAzPaTuzrFrIOglwu0ikOzDjTo9MP
	sT/kLxB0ukk6j2q048QHxMuOJ8iXNb0j0EX9Npa5/HS6zuQFF9waTotyoLL+AfpUDr4iD7q3kUk
	dh/gjPrGbbmHna+wRCeC9MwI1jQ55cGbIR+P5b2dN0ZkB1cKoq/m28UoR1xpo1Uzwt1Wlywyo43
	OQ8ytsM0GzErWWUvEQTaqoVyckpxgJ06pLtJ9StKrdwPjs/iDwUP
X-Received: by 2002:a17:902:d4d2:b0:223:3eed:f680 with SMTP id d9443c01a7336-2234b05ebcamr5375255ad.18.1740595706601;
        Wed, 26 Feb 2025 10:48:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQ15Vf44+Aee27H94lto+wJ2ly/0QZaUFoOURT9xRzc3vn7iSFG3Y4N/butAeJ8iwsmZSAWw==
X-Received: by 2002:a17:902:d4d2:b0:223:3eed:f680 with SMTP id d9443c01a7336-2234b05ebcamr5374225ad.18.1740595704725;
        Wed, 26 Feb 2025 10:48:24 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a8393ffsm3932214b3a.170.2025.02.26.10.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 10:48:24 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: linux-wireless@vger.kernel.org,
        Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>
In-Reply-To: <20250207060005.153835-1-quic_rdevanat@quicinc.com>
References: <20250207060005.153835-1-quic_rdevanat@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: Improve BSS discovery with hidden SSID
 in 6 GHz band
Message-Id: <174059570392.3119794.15041194806483744481.b4-ty@oss.qualcomm.com>
Date: Wed, 26 Feb 2025 10:48:23 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: KqmS2WEZRQa85GsCEyV5zLPYV2UI58p2
X-Proofpoint-ORIG-GUID: KqmS2WEZRQa85GsCEyV5zLPYV2UI58p2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 adultscore=0 phishscore=0 mlxlogscore=692 mlxscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_104830_801332_736DC82A 
X-CRM114-Status: GOOD (  12.04  )
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


On Fri, 07 Feb 2025 11:30:05 +0530, Roopni Devanathan wrote:
> Currently, sometimes, the station is unable to identify the configured
> AP SSID in its scan results when the AP is not broadcasting its name
> publicly and has a hidden SSID.
> 
> Currently, channel dwell time for an ath12k station is 30 ms. Sometimes,
> station can send broadcast probe request to AP close to the end of dwell
> time. In some of these cases, before AP sends a response to the received
> probe request, the dwell time on the station side would come to an end.
> So, the station will move to scan next channel and will not be able to
> acknowledge the unicast probe response.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Improve BSS discovery with hidden SSID in 6 GHz band
      commit: 27d38bdfd416f4db70e09c3bef3b030c86fd235a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


