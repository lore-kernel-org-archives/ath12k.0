Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310A0C369AF
	for <ath12k@archiver.kernel.org>; Sat, 12 Apr 2025 04:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRll4vgMpvk7I3TeSShcenQajwuJaTA6uths+RbEhTc=; b=RgICYoY0HPsqEZthrcrKm80MHJ
	H8QnyFwxTViPu4HObb/88W+Z/OPOFAXxPXLYp9ng85xMHPU1BDrqDDKw3gFaURWqgVvtpIn6cE+jN
	k4VBqGNScgpjpgepnpNMFjFcI5Q+6Leqxhwm6WcNoYvBnOYdA7qDLNlyf7xvNXXTz93Y0VQG8CVDa
	PPU6zEIEgzDzwgR5PtVSNjJwXo05oM7QM3jriCSc0bjR5UPLRt8QDZYSw0i8W9XTGta4bjNBvtFBE
	B9nDFSnrXadL5xTCNKxWrFMt+C7bYCa5LIjhc4MAsM4rlL1ooBa5llmnwPrk1ed8rylXuSeyvZ38r
	mPDRy9vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3SPg-0000000FPOD-3aE8
	for ath12k@archiver.kernel.org;
	Sat, 12 Apr 2025 04:24:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3SPd-0000000FPLz-3ipC
	for ath12k@lists.infradead.org;
	Sat, 12 Apr 2025 04:24:14 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53C3jd69018408
	for <ath12k@lists.infradead.org>; Sat, 12 Apr 2025 04:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qRll4vgMpvk7I3TeSShcenQajwuJaTA6uths+RbEhTc=; b=c5DjmAeFP/Qu0UO2
	Rss2ba0gM/VYJgDFZ7GHD7w4WgXDrRu2VQyttLwD6qgu3+COlqORG8A3Y9/4FbZS
	a2gFeMqqFw5xVGVpVmd2N9lxs+Wtjz7Xz2hZNwXwcWFDKNsCMqiWz/f6q/8pR/Eo
	R7kE4CX5MUF/fZ1/dA7YuhoqQTBTkMf94qRBPhXn1CFcxgBGtMKGE61i3rd4weEg
	rcVO30uttITL6TTVIWaSfkc59CovzVA3KVJlUiN4crjY4qxHd0WpICgIJc6MA6BA
	i3kD9/V1QfW9zOgBLI5ZS9BT8uwcVV12bn6tQY2+g2M8sHgBrbIen1H8XVFBLEXb
	mVgCEA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd681u6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 12 Apr 2025 04:24:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff798e8c90so2477800a91.1
        for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 21:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744431852; x=1745036652;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qRll4vgMpvk7I3TeSShcenQajwuJaTA6uths+RbEhTc=;
        b=RDPS8mttBZrbjJIY93OHXmI9tmhEaqYHpv+vKgdmyQTKJtKWeNKm6F8vaQeyAYe7Cq
         WVN/JWwLbCDoLkfqXLWW4SHAUBD+3wfuovAhNTrnYxk+npXNc5Q5Wl3SZ2he/gfV4qbv
         yrTPspSUEYX4S63l0TcS0VP6utHm085G5x2Sj0PWHuR+VI6HSxZH+BT2MkKyxIBGOmLr
         nN2corXkwwMHlqlF9lT7H0ponXetL6+FS0yfO+ro6eJBscxu8Pac8FrpJks3Qe1aqXpT
         RE2C/4cFI25bheLRiXOuEIYmyR/W3kfBrpVyFKos30W/Kov3UUeGNeL7l7GPP+WYBfu8
         8wBA==
X-Gm-Message-State: AOJu0Yw8NVbNH8b/sD7eTO2U1oYL04VsJMU9XmMK8HtqLnA/ySuucKVc
	yVcAwtW4nED8U27owdfPoD1AEJJRwFOp9ta5OBM16cPW908pKz4qGhUBeg2yF9f6GLow/HZHPw8
	5sA4WyXS3VkeSCL0A9iBirMw96On04gBFt2ujnzaWLP4QIYU8hOwtEw0VW9hIshtLuFcU
X-Gm-Gg: ASbGncvBW9F6S9rOacixa5r1rT4LZ+AWwmLkBObCzAwvOXc6xGO0VmoeTwlZwaD60fd
	TSt7XuOQHp/IgmMjZyqwGJXOjFf7zC/TIh3yDd8Wu8KSD+IYE0BUoqyG/nE3eztlJhZUjLrs/Tg
	/ZtA2NCtJSS9JuaQ3/M0M5oV7OiJQ6oGB6AHLNNzFfSC4yUg3qLshjBbTnl3DKTPyic11DTEDOx
	4pYQx/3vtIM0Zt+0qGh4BZYLC479hWCHoGdL4VGRVg54YI2Lu4jEgBjXuh0vQjVdg9KkQw7Bm9w
	Ivbx6Moca+ZZfGBhLGXUA3MUGI5Z3ketAgGccNpicJ1Z22xt
X-Received: by 2002:a17:90b:5245:b0:2ff:796b:4d05 with SMTP id 98e67ed59e1d1-308236640a9mr8416818a91.11.1744431852283;
        Fri, 11 Apr 2025 21:24:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlSpSvsTEJSvQ+Eadls5Q0B78jABlWjDlfPnJuqO0/VtCI5W3IC4wRGCBymP8YzkaF5r4WjQ==
X-Received: by 2002:a17:90b:5245:b0:2ff:796b:4d05 with SMTP id 98e67ed59e1d1-308236640a9mr8416780a91.11.1744431851754;
        Fri, 11 Apr 2025 21:24:11 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd11e643sm6829912a91.12.2025.04.11.21.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 21:24:11 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250409152341.944628-1-ramya.gnanasekar@oss.qualcomm.com>
References: <20250409152341.944628-1-ramya.gnanasekar@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix WMI tag for EHT rate in
 peer assoc
Message-Id: <174443185117.2972989.1592486268717091653.b4-ty@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 21:24:11 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: bsaEw3CX2MW7mNHoJm4nuEoDTywP3ZEl
X-Proofpoint-GUID: bsaEw3CX2MW7mNHoJm4nuEoDTywP3ZEl
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67f9eaed cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504120029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_212413_932907_B7FBC91A 
X-CRM114-Status: UNSURE (   7.61  )
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


On Wed, 09 Apr 2025 20:53:41 +0530, Ramya Gnanasekar wrote:
> Incorrect WMI tag is used for EHT rate update from host to firmware
> while encoding peer assoc WMI.
> 
> Correct the WMI tag used for EHT rate update from WMI_TAG_HE_RATE_SET
> to the proper tag. This ensures firmware does not mistakenly update HE rate during parsing.
> 
> Found during code review. Compile tested only.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix WMI tag for EHT rate in peer assoc
      commit: 1a0e65750b55d2cf5de4a9bf7d6d55718784bdb7

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


