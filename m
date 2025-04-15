Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D443C369B4
	for <ath12k@archiver.kernel.org>; Tue, 15 Apr 2025 14:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h6ICL7BEh43VFjprVAuqJP1WzL3ML5MgGF+4l11v0XU=; b=OoPpjuTtlFLQDb4I8Ebul9b+gx
	1mcA3jEcIfpD2dCTDKqZ78NWb4U/HOvmzdMgCgYgR3cqgeRXBwE47+uwjXg6dCx+XVlnNC5Nbms4B
	mEQhAz6WsI9aECIdxfYoxxIbVhx2CwdqlQfQSwYgz32S43KjH0kevIufS4qZ1zCts25nB9yXrMOBI
	fWpyIEprxso7YNzU2hDxjnIV6b6DOvcF6Ga+Q8Y00Bn86+OblgWgrDZCiiGMY0ABpjf3X5VnBUdW1
	09ZL8y73Hv4GQp7FvIMuedJmcl4N8rkMi3kj6j1y/qW5ACvyBbjmoWhZ3xc6U/1s73guSnMzE/q4M
	fGh3f+uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4hVN-000000067u2-1J9s;
	Tue, 15 Apr 2025 14:43:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4hVK-000000067sB-1XJ3
	for ath12k@lists.infradead.org;
	Tue, 15 Apr 2025 14:43:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tCrW019546
	for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 14:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h6ICL7BEh43VFjprVAuqJP1WzL3ML5MgGF+4l11v0XU=; b=or4Y94NLvXlkOWbh
	yndXM4dqsCH3uzbT2pneplU3Z0rQ5X4onfOYsj1lkWeLRcYXjpD2djPtZFZdDdC+
	mGKzdnVUg4JHaQirT7BrMTniqoYnMQGmWtUuiJG9ECGupA3hfzxsfab4s1i4ieOi
	1UxUvEHwBAMqu9+H4/be5nzTG32MedU6diQ7BUIeR2exFxNeIALMhl1mPv9Wz57U
	Rvl/N/KUG0udnGVjiUD8+N/lZaLMudFqCpCCYTJozQZqeVSSTaZfr1AzSZDfwkIW
	fMova8PiIF93rHqbfDDmz+F8SaAJLSNpNYGYroDZ58M7VN+WI0BEZB09QuYy/tVq
	iOEZWQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfd0bpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 14:43:13 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-af547d725e8so2499116a12.1
        for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 07:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744728192; x=1745332992;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6ICL7BEh43VFjprVAuqJP1WzL3ML5MgGF+4l11v0XU=;
        b=roe3HEh0in+u960SLD1uwR5R4rO3vwzoxc4IecUqx3GUsRn6c7Ttks9Osue875jk2G
         JzJuVQTjLd3BPN65DgaBLwr0H8C09yOmeEuYaE3YXGvsgUcIzE3UINGZOzQWszE2mO58
         8JG+YC5lildTVDkopsLkRlOPC4NLkgvxMHpCzGfin+C9gPIMwTT5K3H80HjB1aXvJD3q
         kdjeBdRkgMPiNhEnInvSGwqIW1ckl8ihgpBPZr9OF54ImOmCCuVkZVqnGu1r7MBFAyJX
         q2r+HktdZ8VZVVVQ8Ok4AMUyUhpEbvLLQWuwgx6lLfJKORyTERdevXlFFWLxsiQMIx+Q
         J6qg==
X-Forwarded-Encrypted: i=1; AJvYcCWAzhFgUZ3hsVj71IMabqV3UmhTiRLwtY1z2herb752DVnPVRX7oF4t+jVUU3/OmX2zSht+1JE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxuA2t0tiLzIzvk2GTXBgnP5bsHhvJbbmNeICJ4u4s1+csk96ne
	RmloSBQBRGejsu85CUMAL0veRy3+8rlM/bowJf8XkvofUSErTpRmeb66ArBtmpyjDSE/Cq15SdR
	K8gAuB92f8AYORZMpIyYKkBTVli8vDAMkQyhPT4nMMS+gCflOsjXSWY8q/7i/R2a6Lnjb
X-Gm-Gg: ASbGncuu0mMXYWEKKE/xXUCBwQE8/4Vi/wMS/DMXunDgews/6VGYM7SaBUK5Eivn4BF
	6oq0dIAb/snTV/viOtz3f5EIm8eg89OAUXIvC5hiQs2t4u4043ica+XSbz3SuMARjKC+jPp+YL1
	lR0egTQ8Mebmwspj1tHd7uHfA6lNJAkbCBzh0/yOJmwSoXwfUGS/hfPmcIHSF0CD3eN31ZkUjS1
	/5vjm7bxXRTnLQ9NMh/UubQR6d4UPk9Y96qMQz3b9luukpnG87rkI7zPHMdBIWgNZpdDeKsg6lT
	/aNXG7M3mj43blgnpruT/AHnUxEpbAwk/+mN9deoAWCM0qzv
X-Received: by 2002:a17:90b:5608:b0:304:ec28:4437 with SMTP id 98e67ed59e1d1-308237a835fmr21900885a91.22.1744728192175;
        Tue, 15 Apr 2025 07:43:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyR4k+U3wrA26IDmVPSvO1zldLv5AEmcnAVQdQ78ZBZNLqFhBBmRGjmnMR3F7eCa5IdvSpeA==
X-Received: by 2002:a17:90b:5608:b0:304:ec28:4437 with SMTP id 98e67ed59e1d1-308237a835fmr21900842a91.22.1744728191639;
        Tue, 15 Apr 2025 07:43:11 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb5484sm118444955ad.183.2025.04.15.07.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 07:43:11 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250409-ath12k-wcn7850-mlo-support-v2-0-3801132ca2c3@quicinc.com>
References: <20250409-ath12k-wcn7850-mlo-support-v2-0-3801132ca2c3@quicinc.com>
Subject: Re: [PATCH ath-next v2 0/9] wifi: ath12k: support MLO for WCN7850
Message-Id: <174472819084.1897624.8327672522109737794.b4-ty@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 07:43:10 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fe7081 cx=c_pps a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=2isIlgE5ipHJW2kUYQMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: sa3DK4FWdpc2h_T1WyrKjynTMEzhltRo
X-Proofpoint-ORIG-GUID: sa3DK4FWdpc2h_T1WyrKjynTMEzhltRo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=910 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_074314_422895_7FC2F708 
X-CRM114-Status: GOOD (  11.69  )
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


On Wed, 09 Apr 2025 10:26:33 +0800, Baochen Qiang wrote:
> WCN7850 firmware uses API-1 so it can not advertise MLO support via
> firmware IE, but instead it uses single_chip_mlo_support flag in QMI
> message, the first three patches serve for this purpose.
> 
> Currently ml_arg->assoc_link flag is not set in
> WMI_VDEV_START_REQUEST_CMDID, this result in WCN7850 firmware crash
> in MLO case, so patch [04/9] sets it for assoc link.
> 
> [...]

Applied, thanks!

[1/9] wifi: ath12k: introduce ath12k_fw_feature_supported()
      commit: dad6de9070a8dfc8268ed7c1684b81d1e2eeaa97
[2/9] wifi: ath12k: use fw_features only when it is valid
      commit: 6b85b83e46516ce38ce82dd2f1c4e40d183aa311
[3/9] wifi: ath12k: support MLO as well if single_chip_mlo_support flag is set
      commit: 32f7b19668bd2894f1a236580c2132fc4b9f4449
[4/9] wifi: ath12k: identify assoc link vif in station mode
      commit: 0cd46d1f36ced0e61bd6d8cdce7c9eec9563d294
[5/9] wifi: ath12k: make assoc link associate first
      commit: ead6d41116b81098061c878d9bfc0b1a6c629090
[6/9] wifi: ath12k: group REO queue buffer parameters together
      commit: 3aba3a1422656850dd1f87843ca34acd379a29ce
[7/9] wifi: ath12k: alloc REO queue per station
      commit: 3b9cbce6fdd3d511107e7eaf27a0f1e0d73038ea
[8/9] wifi: ath12k: don't skip non-primary links for WCN7850
      commit: bcdf2620f95752af542c18ee81a83231d4993953
[9/9] wifi: ath12k: support 2 channels for single pdev device
      commit: 176f3009ae598d0523b267db319fe16f69577231

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


