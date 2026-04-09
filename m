Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6A1F364AF
	for <ath12k@archiver.kernel.org>; Thu,  9 Apr 2026 18:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=89pI+kXSa45NboUoHN4veKtx+cAShuGTWMwxJuwGRts=; b=RyAKcWySsseFmt
	qHl6usEMdmgOz2+74Qvh/Y/AWA8lYE7NLzfW9aJuEbNVSOjX9UCeBVfH/beRfSekegCnTvMAZF0q2
	6lNq0Ycu+oiJcQ58EFMScBXPOJ05bvyZ0JuIUSJNJFqMwLVjRSIzNE9xTDKmdiplT7asE9AYwjT3l
	UM1OK7MYWs6kpI59mD0KuUUJlROJKrX9bzaHIYWHCWyb3VS1bRuXP2mtwtX96wQ2ewjbrGadNY1oE
	JLiY2/Hwueq1ezEl1bIKqYgl6V6qVND8apy7TphVGwpPR7FBCvMsqREfg5Oj7Ozs1lQi11MIARDBY
	lXkJt7PIy5+W/zcu7PZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAuMh-0000000B6l4-1h0J;
	Thu, 09 Apr 2026 18:44:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAuMe-0000000B6jR-3x5A
	for ath12k@lists.infradead.org;
	Thu, 09 Apr 2026 18:44:30 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639HRaFA3352647
	for <ath12k@lists.infradead.org>; Thu, 9 Apr 2026 18:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=89pI+kXSa45NboUoHN4veK
	tx+cAShuGTWMwxJuwGRts=; b=hLitgAbHo8iQRwtW2Vc0Z6hVZzTYwBltkttz9+
	aMfHumeY46SCnhbemsyUZHtfRjQnK2/SuLGWi6OcAXAk7OyEbRW5yoLgkkkVQCbw
	VSavD78K/OQ+NTrJdvRMnEfWnzVhZQAmWOGaAREpqqJGgd3bGGmRkgNlSQC35wkU
	SRbWd77XAK/RytJWiXL0iexZMbhsw+XnSAXTKsych/FTgSPWggzw1m/BCEZ8LVYL
	q/ndwTTdJw0kUglwFNNXcqpxjFM7cqIqiZfk4bKIKOwVcLDX7KCChuoG18BP45PV
	eT/Z1Sb7FzcyLEqfw26hLg6CTfIQ2UeLCarMSz3Th5n2Pr9Q==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec1qsguc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 09 Apr 2026 18:44:27 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1279caef718so11729018c88.1
        for <ath12k@lists.infradead.org>; Thu, 09 Apr 2026 11:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775760266; x=1776365066; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=89pI+kXSa45NboUoHN4veKtx+cAShuGTWMwxJuwGRts=;
        b=VwpbAAloL2geRwEIA/XIT7u+r7ItNncD9pRj/8UHvIojBMf+IniAU8+YX5LMRKwRtV
         9YRMLv+OqBLjUmObfCgW5Uj8bbKfrU0FzrfJX8P5u8q2C6tL9o/q3f4W4/jhzH+4AxPY
         ROTQHtbwg3LtS+Lox7/RiZw3sXqwkhMG17xpuJS2ESpV4jBmrPinHeiCOlvItCGf58S3
         jaCyb06NSEqe289I5+DvcODFmwfdtDSRoJNulr8FalSpLh/oaopTvuN860H41ZC9eRxL
         DGqGwWPCDPn/JRjp7YoP2pf9Ldw3yFm2Zq9ng9E1TXyPcIzCX4V9uTKHvWGh6F7Tqrk+
         EI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775760266; x=1776365066;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89pI+kXSa45NboUoHN4veKtx+cAShuGTWMwxJuwGRts=;
        b=QReSIuAozUdCqtoz+HJqEgwdUpzvpQ1euHatUreVim/IGG+Mq5M/ZL8ETEE3Mgey3F
         ToCHrWKjdF+iKFOpurImpSA0Pbs2ArmxqIXmYQypka5tik4FfTZyk9get6MQfNf3UjAn
         GfzKzly9LPevWLGWMdGHy+BB+QsjUXMe7TMnicIu01RfR5PA/umKKLIIvXugB3x1jO+d
         1Ov/DLTF1LV3xrSRN7CA4nEMJfIuZB/Z+pRkRj7DdKSu24wHXEQKK0ewVS5QMPNacoJN
         0ajYNuaa0JoYTc56f4N4FBsDfZeX52V21+gXcAlSvGcSn1TUvS614moef9eTd5P6Clnx
         DUTg==
X-Forwarded-Encrypted: i=1; AJvYcCVV+2Si7oX0heo6cdQNmrPHZ0vJ5S7Fwo3Lxn0gJfErqJL9KKcKrOfnL7LmAUcIScspKiLgS9I=@lists.infradead.org
X-Gm-Message-State: AOJu0YzXbsyNo3C+FrANuwtY+VlzhAaEYyc/EUG8LqpscfsazRcuN1E0
	tyKa+5G+mZnSlzECv7VpZoGkq9HKvrX+7D3gSbTIODHOWuF3zOYvbGiQpktVVR2gWIHrTCeaQNQ
	O1Q7b8uuxWl5I/8cVd8/zJgySWue3JSaoI8/W9mXa3wxsJsM+dTMHXZo5H7hqST4A
X-Gm-Gg: AeBDietw07LcmzhWpHVAmJWrop4HoTzV2TwkcPETNGKXWA2GP8nVe92WmqFvkKaYKU6
	aPbWu+uBTjzyfJeuoXbRTl/s+CmxbQN9FIg55V4P0/qlHJbPdOy8BuSFJUp3nevfEwOZ1twTbem
	YNGrmvRM0PwW9DRuGsw0ihmo8dlnLyiOqkTTw5tKrg04Iwtm1m9PjnEOriWhQKFt9U6Gzkdflbq
	RzObGpqK4a1yD/9Vv6S4v1qEkwD+FLtWg+W/r5aKQGeuOUp4NluExL8RgIIJHKEnL5u0McOwsqY
	RrG7ARolKu/yPBOpSmxclcl84m9R2r0ex1gK5IBfdAweEE0+ebwHzZobaX2PZ48K40QnSHFTbVw
	k6Oocy/vLRugJiUzQQzTEDtq4cWTix7DyiFbGf1m4M23G8TIYPLf/TMDawiA8tKu60RvDkH6NcQ
	rl
X-Received: by 2002:a05:7022:4387:b0:123:3500:b688 with SMTP id a92af1059eb24-12c34edcfd7mr108246c88.19.1775760266487;
        Thu, 09 Apr 2026 11:44:26 -0700 (PDT)
X-Received: by 2002:a05:7022:4387:b0:123:3500:b688 with SMTP id a92af1059eb24-12c34edcfd7mr108226c88.19.1775760265941;
        Thu, 09 Apr 2026 11:44:25 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c34352490sm513985c88.0.2026.04.09.11.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 11:44:25 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: Consistently name struct
 ath12k_base pointers
Date: Thu, 09 Apr 2026 11:44:22 -0700
Message-Id: <20260409-ath12k-htc-proto-v1-0-cda86d6355f1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIbz12kC/23NQQ7CIBAF0Ks0rKUBCo248h7GBYWpEG2pgE1N0
 7tLiAsTu5nk58+8WVGE4CCiU7WiALOLzo850EOFtFXjDbAzOSNGWEs4abBKlrI7tknjKfjksdR
 Gy5b2jTQa5bMpQO+WQl5Q3sYjLAldc2NdTD68y6+Zlv7L8n92pphgLqFpoBNUGH72MdbPl3poP
 wx1HsWc2a8jdhyWHSWhk0ww0+rjjrNt2wcETH+FCQEAAA==
X-Change-ID: 20260403-ath12k-htc-proto-9cdc961f39dc
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE3MSBTYWx0ZWRfXyMzsoHRtm6+P
 6tRSWRDpHWVsk9+rNf4s3nL8DRcsmORRuuBJJ5dqNpxGDynqcCij9Z213xINqtov4LCnCRbqM2W
 WZRFKiZkjtKJ1w6x/McPaHLj4SBqCUUn+UYbRdeZjznHLHD72SwyCZqIibz0b/T9eZtPbdOEVGW
 kfPGl1OTlJdDGVsh6aTMEXYTG+6aHEDrw9KMW07mwP+HCdcbn7EbvpJwYT6GyDQuk6UO77FTlM9
 dQnzbxgnfB2pY2+laPA2cPoqwzL+UQrjMt01sJGaQzX/ifa/X+8nkt8zVnRuBLFLXSVzmg38eKY
 RevBE6AVpZCW/mV5iyitxLs/OEDexYt+YIoo/43v91pjddbvUhLKbqdmc3000Ju0Om4ObAlqFXr
 i4ZjSgUNIL9eDu2myn1dVTAxU8MJOrvmbqZuMsPOYNS03Kmu8RlXTwNt5n21rFAxL6rzZwMtk4N
 2DQ1/Cjl0XbFvK40vdw==
X-Authority-Analysis: v=2.4 cv=eOcjSnp1 c=1 sm=1 tr=0 ts=69d7f38b cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8 a=Z1KRubcUBZuEHTMtPaIA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 3lh94VdNpiQ1muXV96e7YeB47W9FH1xC
X-Proofpoint-ORIG-GUID: 3lh94VdNpiQ1muXV96e7YeB47W9FH1xC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_114429_129407_2152BD7B 
X-CRM114-Status: UNSURE (   8.79  )
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

Per ath12k convention, a pointer to struct ath12k_base should be named
'ab', but there are a few places it is named 'ar', so fix them.

Note that one instance in ath12k_wmi_tlv_parse() is not modified since
that instance is being removed as part of:

https://patch.msgid.link/20260407095426.3285574-1-nico.escande@gmail.com/

---
Jeff Johnson (2):
      wifi: ath12k: Fix HTC prototype ath12k_base parameters
      wifi: ath12k: Fix ath12k_dp_htt_tlv_iter()'s iter() signature

 drivers/net/wireless/ath/ath12k/dp_htt.c | 2 +-
 drivers/net/wireless/ath/ath12k/dp_htt.h | 2 +-
 drivers/net/wireless/ath/ath12k/htc.h    | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)
---
base-commit: 15551ababf6d4e857f2101366a0c3eaa86dd822c
change-id: 20260403-ath12k-htc-proto-9cdc961f39dc


