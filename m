Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBB7C369C9
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 22:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mseXXsT2rvj78UcdMHrlXZNdcLTz9XtO2FLR3j+uBE=; b=kz6A9dI+HiXiLF4z6IxMcxSzPa
	nieoYRD2h4kkprrMwiu4bI7WppG1QKwS0KF2XQZAEx/dsIdfh46xxDfNOCfC9ALmnvKGTzu+BLS/H
	ma5a5b5/swk5O1aLYAHf3at20tPoWWhq4PGvFGs6KTyE6+dGflFCBmXp7yrkuNVrIi8N1qqf7KzP4
	mpejrj/2EfyRRRxXPBHgpIM8T6wbXjn7Wjn9MHuZT4uZtW8M25olv/CeqpFnFmj2N2+9IvPXJVzw3
	onjWyaTmIXP7Fpp6KXYUX00UjLH9v/hRVUYBZAYkO9kQFWzQhDQUvh0aA830L1Rehggx/pvC/PK0C
	I0cN9Rmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YAx-0000000EVS2-3Rrz;
	Thu, 17 Apr 2025 22:57:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YAt-0000000EVOG-2M22
	for ath12k@lists.infradead.org;
	Thu, 17 Apr 2025 22:57:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClU6G005236
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6mseXXsT2rvj78UcdMHrlXZNdcLTz9XtO2FLR3j+uBE=; b=B2KoRiFFbw9VL1Xs
	oj4rwp9Ki9QuZ5F9cSRaTkMiYcci5wRq5PivlzypP/mQyQAGprcus3FQcwXipdXu
	W7yfWEK5JVE1taoth8/ivI4WIv6E4S+coDMiZbTL31yxREofHkIXHf769YqXtrk0
	ZInRN1qUsmHzHe8tqVKpy58avZocmOyecjfeacLqA7O1HIXCMrw8jV6u2Izs+9S9
	xgpDZL6yZZeCTZz+oqs/9L41S0CCb0ZwT6clJFC1dXZpfpt4GOAcAhcWJEyQ4NSD
	MlFrUJFqYIMlscjI7qL+FENUW9sWXph6wxjU1rbwDbY6UWCtBrsrCDU4jRbgn3kB
	7FCPRw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf6a0e0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-72f3b4c0305so1475529b3a.0
        for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 15:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744930657; x=1745535457;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mseXXsT2rvj78UcdMHrlXZNdcLTz9XtO2FLR3j+uBE=;
        b=GDQU2FAF5M6yVBofMwsZQNCRFMEfaK6z9n7UNxSck1m1hNQ68pNKf7Ex1mQ/YZ2zBb
         K2g1w1O0teRBFZKG3Pn7VsX+mKfvwT+S9Zbsb065fOvvx9ShvnYZ1KyOIvPI77Eq4pjl
         EyDqA8IhgYqSg5umm9BqMyg6Ro8ncexQahJzo8auC64ugrVgDEHaW/u+prf79WdetNMw
         JvSzkGlx3fpq0Fr20Xii9EVaPOqlb1rvrHeuymshvBZ9+U0Ppqq5X8w51jujoBA4Ogfd
         u0ag1MlKlQjB3TurWJseQsdlndrDWGCwZgZAJak4Q++PTRTklvgPbGGyDUmAw0DoJR8h
         A/Cg==
X-Gm-Message-State: AOJu0YwS3Y5jHp6cc4wm7DER5v6/YYWQAnfB4XcCuvBZDrXqooiFYFsZ
	/W49GTb34b98eO8CUTHaaN1rJR+0/iebo0AioRxnutNfxlSst7KZj6Aix7idqn6LXCFHIy8u06/
	/tHNNQu86QSQMvVql1tZLUXMQVuWiL/Sxx1BhhgEkA609M+zVmX4kayL28vy0Ce5JU+qU
X-Gm-Gg: ASbGnctOj4TCtwTtspWMufux55sVqlD5UE2Zq4NEE0f6FoxDEiW//3NlBQaaDo1bKya
	DbFZGTDSNv419PQ0BAGJPmWfAmW3RRBvY0k64NdAADQMDRcHz+G+YA3Yv/9GgyWHFad5ocbqy2C
	pnlvhSh1TVT08ACX26gDlWZvo0TfTU1t0XYT6faDNHWPCJdFXOO4Wn+7OHVZWGnPKiErwr+TQJ7
	KfbhTT7it+X5EEhmS7QmakEv3sJSrbaLqskstnyczJdzRfpFyPQX6xrTcxpBq5H5QOQr6+f6RAm
	HljQ0oql8FP2fhh71Nkf2fIFbI6dnet+7V2mbSsCbSK/Ke/f
X-Received: by 2002:a05:6a00:2e14:b0:736:bfc4:ef2c with SMTP id d2e1a72fcca58-73dc1190a44mr711429b3a.0.1744930656924;
        Thu, 17 Apr 2025 15:57:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr+3fQPj6racX/qlv2osFlwwq5M298/9HDA0FCIhMVsFMlx+2+lKchQEI5gEDY3VAqYY1hDA==
X-Received: by 2002:a05:6a00:2e14:b0:736:bfc4:ef2c with SMTP id d2e1a72fcca58-73dc1190a44mr711411b3a.0.1744930656450;
        Thu, 17 Apr 2025 15:57:36 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf901187sm426468b3a.76.2025.04.17.15.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 15:57:36 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, P Praneesh <quic_ppranees@quicinc.com>
In-Reply-To: <20250416021903.3178962-1-nithyanantham.paramasivam@oss.qualcomm.com>
References: <20250416021903.3178962-1-nithyanantham.paramasivam@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Add MSDU length validation
 for tkip mic error error
Message-Id: <174493065577.1347382.15140238727557332609.b4-ty@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 15:57:35 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: 8UVlnfwITieM6nH1qI8kqdMbIDYVJbpa
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=68018762 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=fAuNF8LVcKM9mBkeKYMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 8UVlnfwITieM6nH1qI8kqdMbIDYVJbpa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=823 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_155739_727208_720DF80E 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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


On Wed, 16 Apr 2025 07:49:03 +0530, Nithyanantham Paramasivam wrote:
> In the WBM error path, while processing TKIP MIC errors, MSDU length
> is fetched from the hal_rx_desc's msdu_end. This MSDU length is
> directly passed to skb_put without validation. In stress test
> scenarios, the WBM error ring may receive invalid descriptors, which
> could lead to an invalid MSDU length.
> 
> To fix this, add a check to drop the skb when the calculated MSDU
> length is greater than the skb size.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Add MSDU length validation for tkip mic error error
      commit: 763216fe6c5df95d122c71ef34c342427c987820

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


