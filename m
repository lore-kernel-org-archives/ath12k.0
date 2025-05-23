Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96F5C54ED1
	for <ath12k@archiver.kernel.org>; Fri, 23 May 2025 17:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tZUadBFHdEtu6nVasWJSp0TAppzK35LzVtrVbC8Wug8=; b=3bqjiQYUz87fQBI1P4jmplW2hg
	ir8I7nPsPUL8sj4+rYxGL58lDu+RPJjNJX2w7O2KE75qcHzA69BzvJWiXozDS+4qSsmtRKF9FgWVm
	P9lCBZp0Um0OwO+r8Tk1Koxd7CgQNFWPKn+WkxE//yo8TqC9I6/qMkW1IAfLpL7Mnv9hYVWRMV0rF
	Z4EjI4Jd6mFbZxl8yhQH1KqLWnp1CzTEuKnNuOB4WC8ffPYaMyz6zgbj9QIHZJGAmYw/iUeWJqHeL
	SxfM4o7iv5Ai9fQ/MmrykDrXaMyoVMSLO5627CBlgpog687TaQV7O0n/VRu6SNlFw9KSfSAuMBD/f
	qrrsbwJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIW7Q-00000004WnT-1w5P;
	Fri, 23 May 2025 17:23:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIVsM-00000004UZf-3Dh7
	for ath12k@lists.infradead.org;
	Fri, 23 May 2025 17:08:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NBaRIN020586
	for <ath12k@lists.infradead.org>; Fri, 23 May 2025 17:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tZUadBFHdEtu6nVasWJSp0
	TAppzK35LzVtrVbC8Wug8=; b=VIsc9/hahModkP8X3PA1B8iC7GVr0M99R3IrGE
	aXOMtHoA+grJu4k3WXH+JuWtnc7F9fefFanwa6ufBzaL+31aP6GpUT4eTozFo5DS
	+uP/sPxDGnjFpdOhZajBfhanvUa1jy6YDpHtixdCXg0YASFpmfyLd9GhoWHqS4Ps
	9dIAJmh+pAOitJfq6Ga0yKPJHbo6QjdRxaVjLt6yKvymZXiolw382/psU+TPAEbD
	7ObJeHHx24IO0UAmz7b6jQDX+AL18ucjLChTa5ja+5XwGW+SkFCmVcaktjKh/ouo
	ggtOOWkfZxkyf2HAI2he2QxssLXXfZbxf2xizW+CGaf2hA4A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb93a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 May 2025 17:08:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b090c7c2c6aso41883a12.0
        for <ath12k@lists.infradead.org>; Fri, 23 May 2025 10:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748020084; x=1748624884;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tZUadBFHdEtu6nVasWJSp0TAppzK35LzVtrVbC8Wug8=;
        b=a62VwW4LrXJ6ftSdKb63yiSBLNJTqj03Vp4cfd+c109T2Q6GnBNjzFOJtjHurCS5BP
         FcI3rFyQdgUFjqtFao9Nr0htNe6g+05bzhAGiyk0QRWBoftVGLpvWuFL4ptLvp5u+C2x
         G86m/SsBHcRDpg1nh2RR3apq8MH426yrmo7MTdEjsSFbCjnmqKpzBSH2Ay0+liPhehrB
         XQF0PdfONWU4WpvMNARXLtnuv1TvAs8OokgzHxT8z0egsvVlWE14wUIvpmap2o6akJoc
         SacS83nNHflvTh66DwC4n0h/84sS1xvUNCbxNhPZ5+WML/5HyO1UG2Plh3jRKvE2I3WV
         s1og==
X-Forwarded-Encrypted: i=1; AJvYcCWGZZcCgBArgBBVQMcVo92yNHCMuUC2tD1M0SrZA7zOwWbAmSvNT5u6AIqt6TBv5whjcETjBm0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzlFzxrvsA4brevc8U4xpfSr3EdN5tLTNrt7OPWjekndeM2o/Hq
	Ul6u7HA+XguR4VIk02j2yWBDp8XXnihfZnz9WU7Fx1hq6WsuwypsvFw11AspfFk1zOdiCiMOoXz
	izldokDV9vn3hxqWf5DFwwaXVUG4r3yEwF8sgz6pE14UEt9hMSpX+q5CcZS5NARYhFqvpxfAR
X-Gm-Gg: ASbGnctQNFftox688lRc2I3D24rEzDAYIXV71MrvrlxTglTVZQIFtWScvM6cu0zNn1p
	fuZv2BuJX4NsbFlsW1HxiAZZPyuvFxHqlJwdFefo/9+MUyA47gyRJIWOeY79l1cNyLZOGlkIAUu
	XPe8G6boSlOSOWU6dwGkB1gZ0RHPyBCw5d0CQugv5RWyrvfTRJ3HKRzUa/GVwAAkERQqtHHUlzY
	m10vC++B5ns+y/rFiId4Hz+7pWJsmZeBZihFy/2/AYo5Qn5FaKTuBbGKW31kCU5W2qrjmaNs0hc
	XxEcyLBhnt4KzuoT+keRC74DqPFFv9Rh+PHWKSr9snn/bAVT
X-Received: by 2002:a05:6a00:10d2:b0:72d:3b2e:fef9 with SMTP id d2e1a72fcca58-745fe03c2damr380007b3a.20.1748020083887;
        Fri, 23 May 2025 10:08:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5x+zjlejQD7iUhgZen4iAhbFV5wkG6YLj4vbg91n7MooaF52e912rywgPZgF74Hdf6hPSIA==
X-Received: by 2002:a05:6a00:10d2:b0:72d:3b2e:fef9 with SMTP id d2e1a72fcca58-745fe03c2damr379983b3a.20.1748020083500;
        Fri, 23 May 2025 10:08:03 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829c37sm13084080b3a.117.2025.05.23.10.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 10:08:03 -0700 (PDT)
Message-ID: <fcfa4e63-e421-42d1-b6da-11d2d7d2dd95@oss.qualcomm.com>
Date: Fri, 23 May 2025 10:07:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20250523
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=6830ab74 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=w00LdxtAzVfKRbiaHPIA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: qvi9l5o_rKblgW6DrklLyL4jjsmDE03I
X-Proofpoint-GUID: qvi9l5o_rKblgW6DrklLyL4jjsmDE03I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE1NiBTYWx0ZWRfX4tPTAS/xuCzM
 gPP9d2zaziK3YcExWihzbhUA9yfm+XGnnkBTXTu0+0x2CB/vyNvUiTGhgANpuX6zJrDbBvZ5x4a
 yy19f8Mxwn9nftUTKaNHKIXbHVTRseYmBTQNRyIGDDIVKGegpiftDNNmzB7O0xsbgfhxFKfugT1
 e6rrwV11A0Qum8L/IPP2MpWc1dP1I7dD6HDButh9B9EDWA/x4hWTCgnT4nnRpxAlOEqIPICMwFD
 4S/z2SvD3x7vaG0+qVG0oCprs4jrOE7ocwaEKhWS709QRAp4VhKaFFdtfjhpEyK0OvL2q4v5/IT
 gAWmQ9+8+Tgf0lLHTk5YeJz444il42Mti4NvRDu+u59pVn9C3olF9xQAXK28k0Zzu8cHy9mjcL6
 jPz9UKACBo+4aIfHampNpLEj2CdwVPY7Ee7qm/rBS+5ciMs9iQwztSJxU682GYh8tljMHG4a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=921 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_100806_816336_DCC846E0 
X-CRM114-Status: UNSURE (   9.10  )
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

The following changes since commit 3fbaee2775a4a6d44021aa035823a7388b0874fa:

  Merge branch 'robot/pr-0-1747839277' into 'main' (2025-05-21 15:05:37 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20250523

for you to fetch changes up to 2e91d8c3c4bd34a27177180a38f62d3ba3c96031:

  ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 (2025-05-23 09:50:02 -0700)

----------------------------------------------------------------

This is an update to the WCN7850 firmware that fixes the widely reported
failures due to the prior version in ath-20250424.

----------------------------------------------------------------
Jeff Johnson (1):
      ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

 WHENCE                        |   2 +-
 ath12k/WCN7850/hw2.0/amss.bin | Bin 6082624 -> 6078528 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

