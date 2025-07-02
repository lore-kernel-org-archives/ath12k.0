Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E518EC83038
	for <ath12k@archiver.kernel.org>; Wed,  2 Jul 2025 17:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQvBW8J+BIV30oXgy9cxL4PRkz2BKisbdhQbgoH5944=; b=q0cyz6SiC4wYd1VyiC96IJJUbX
	L4MAho3Y++Umwb4sR81ta2DE+oK8vLmSGqwStNQESPpuWhvlPmnT3QdzYErzbLQY3Okq1GgBkRlaM
	Ld2GZMJ5KHXPtzmTiMV4wWHrO0O0GnHCZB9YCnkLnuI/l3VQLw6+lZs6v8jhIUFoCzTrYe2Fm6Zxm
	toejcCGxdt31I2nCJMe766xW7j/frdV+N7Q61kPxYwAS1z9FXUjH/OiawLQJolCRnuZxITPF8mA1b
	EhcdAOqvGCRZRcBRxmGn7oDADhNQYfI9LXZLraejm+74CpUvHc+CeTH3umhxwiBOBdLyb1Q314nrK
	C449jzXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1Z9-00000009AC3-2Ygt;
	Wed, 02 Jul 2025 17:48:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWy63-00000008ZXG-3eN7
	for ath12k@lists.infradead.org;
	Wed, 02 Jul 2025 14:06:01 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562CgEH2024785
	for <ath12k@lists.infradead.org>; Wed, 2 Jul 2025 14:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IQvBW8J+BIV30oXgy9cxL4PRkz2BKisbdhQbgoH5944=; b=UZiyR4IwMgWge2S3
	QlGiOr3bgTinZWirs1ATmCfFDrcLLXv/L0a0orLcDBO3mUvkoYn1oEgLVfDix84d
	cCqGI8te/i3pKFolagvlGyAVGtUROWVItw/xeFw2oAOxUOhN5csRoF3lUaqp+Ygn
	RyVXUWam/IYtQwzp6ZrHJRrPhlPY8rTCZvlmW0+nib65rM9jBbVtdvPquFhIQE/D
	8FYq/UmTExBeUruspyt5Jx8vk1NTZKjLoK+WVwKqnlJtF6Z0laFFuVa8XVroVbM1
	KkRHbZw6b0h3FJVjqIuZUXx3Q0VqyVnrB0aDdbQ/gbnze501EfsQqgkThadNv3CH
	0fgCQQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9mvhp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 02 Jul 2025 14:05:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235eefe6a8fso50426485ad.1
        for <ath12k@lists.infradead.org>; Wed, 02 Jul 2025 07:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751465157; x=1752069957;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQvBW8J+BIV30oXgy9cxL4PRkz2BKisbdhQbgoH5944=;
        b=Ta0U5N3Uu3P2JDh56KggLl9Mb6Vn8c0nFYeCB8B+YBC6Io5WgCnJV50ZVvHS78Z1LK
         njAK34FRrcIlgoAi0a8HhzIcO9vjOW6+WJABWHAyx+9kQg3ahAZuVHC4S5KE9cnKP2Be
         wGRDNwZ4eCkhY5XW+gDmTBhbimD2R/uGE4MRTgyxYfZ+kR5oGQnmRrnCNzZWEqRX3B8v
         STlbbsu7Tpz16MqTy2OvWsYn3hKni0Vletlb3Fpc8JGcWYLpvbLdH1a+uZsz4yuaJtL6
         Z/MB39lN2OU0isgkQ5HPIlMb4X/OkhtAHTJ0qPqQWJ9v3NYqLy0Vte3+IxA1YV0RedFS
         Bfdg==
X-Gm-Message-State: AOJu0YxN6puOWN51l/GQE2gfND4cOEZbWX8G4Jg0yp8E/AlKhDSHlEvo
	pMKh+gP4nJ9lGflWSt+BSETNSFBjxVsL88SyaWacQDoMcz4MY22fy+/3DmcELaCk9oN7bzRBnbe
	mKXUyqu8AvlHj57cUEPfEO2yLywdOzRfbw6DllC+NRQFKQs9LTf8vC0Z5sjqJKKmm
X-Gm-Gg: ASbGncs0xPRIqAMpEsmSrYH7Yv4sXDXXEb0nzmIUX3kfUPAxegWvo18fGDsN1FRtVMa
	Me7Riryvi192N0S2HdnQcOyKp01iNOyz36/3FqzKF5wDqeWjeUEfYY5L6CtFNoCPmQim/z6pdUX
	GVIz0mVByIA/Xvs2wT1IMlDDDckirl79w+K38Lw903/3CCiVIXuwxWFc4eY+v2caZhKM9ihYW+0
	gCX/NW/PV5l1EZIELQ6lMZQhSKgg9FV0CnLiIhhUEkGWO2/n52pBVOwmVITVhLnSe/qeSqp5fpY
	hY01u6iFBk1BKDf7KK1QTyVkJNHCLP/oRguAziOHkgrU/9UPUzL9djVojMw=
X-Received: by 2002:a17:903:1aab:b0:235:e1e4:ec5e with SMTP id d9443c01a7336-23c6e6335dcmr46361665ad.49.1751465157203;
        Wed, 02 Jul 2025 07:05:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM5Z2FbVNm9hOftU512BCIRmml+BeK0rWxNg2h9Ius09ND7XeEyO5kjNTIeS1U9Z5gE8s9SQ==
X-Received: by 2002:a17:903:1aab:b0:235:e1e4:ec5e with SMTP id d9443c01a7336-23c6e6335dcmr46360895ad.49.1751465156323;
        Wed, 02 Jul 2025 07:05:56 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b0047sm138501435ad.160.2025.07.02.07.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 07:05:55 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250701010408.1257201-1-quic_pradeepc@quicinc.com>
References: <20250701010408.1257201-1-quic_pradeepc@quicinc.com>
Subject: Re: (subset) [PATCH ath-next V15 0/9] wifi: ath12k: add MU-MIMO
 and 160 MHz bandwidth support
Message-Id: <175146515503.3638878.3725879720919440372.b4-ty@oss.qualcomm.com>
Date: Wed, 02 Jul 2025 07:05:55 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68653cc6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=PScoVZ2_27zJITdMlhkA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: AyPmjFfL5qNB-C7X21Km7SNdaiiMf_o5
X-Proofpoint-GUID: AyPmjFfL5qNB-C7X21Km7SNdaiiMf_o5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDExNSBTYWx0ZWRfX45qdu8Ti8nsS
 M7KEQjR/lw1jZbv7RSvdfUf8X7Sq7bw9FBCFDQbuaKy9xg3OSiUIpDew87qXW1OJArojswWEvQ5
 7+h1kpgtdOcgrmpxLhTpLpUBvUPxE5+srLQeRia6yl0lblYRQpGALMVJQTVKyt6E6uXMLAwF+fx
 shSwcFD+k5V/wc61sZ1CjBoz63eIIB4QTtfG2fyw1nKuNgUdbqOuOqhQvdZ4zNeKGbgExi3uAem
 KmuyccfH/6VqCl1CxFLmKuhKzifYjQYblV1J1jBUkfI49UshzM4T4DCdB9LQfQlb9J3B1rZ5fnL
 oFETyU8a6lRgLazMYmNvxfORLkYCLKYr/PhZ3BScVDYoCMbN2dfarMuRBZOxtdDCKzzBhsxIJ2Y
 gpdrq4ANXmWXIjeOCDKJjE8wQqxRNoDCSAz4RxKed5cxt+iOJTBC3rE7zqhm6pDTR1AiH01v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_070600_043560_C9ECF05E 
X-CRM114-Status: UNSURE (   9.97  )
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


On Mon, 30 Jun 2025 18:03:59 -0700, Pradeep Kumar Chitrapu wrote:
>   Add support for
> 1. enabling MU-MIMO in HE and EHT modes from hardware
> 2. setting fixed HE rate/GI/LTF
> 3. 160 MHz bandwidth in HE mode
> 4. extended NSS bandwidth support
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> [...]

Applied, thanks!

[1/9] wifi: ath12k: push HE MU-MIMO params to hardware
      commit: 5d6707e88e7fe2d603ad45c5fe7eba096be9533a
[2/9] wifi: ath12k: push EHT MU-MIMO params to hardware
      commit: df8207bc0b4895c18e98a4b084806222b592d9f1
[3/9] wifi: ath12k: move HE MCS mapper to a separate function
      commit: 1eafb8d15d8af39ac7b4d78d69b17f85aa8e00fa
[4/9] wifi: ath12k: generate rx and tx mcs maps for supported HE mcs
      commit: 5ab7479a063d1b557fa59999de701ad8a4624b84
[6/9] wifi: ath12k: add support for setting fixed HE rate/GI/LTF
      commit: 9ad6b169ddef679a64727e3870a6177c78f24b05
[7/9] wifi: ath12k: clean up 80P80 support
      commit: dd25a004fb66c60934fa9572298671c1eb1c06c2
[8/9] wifi: ath12k: add support for 160 MHz bandwidth
      commit: 18ab9d038fadd35d8a4ac5db87ad16dde78f5fdc
[9/9] wifi: ath12k: add extended NSS bandwidth support for 160 MHz
      commit: a82ce08775bc5b50613d48ab7e41b25fc46825af

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


