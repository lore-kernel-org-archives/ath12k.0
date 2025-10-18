Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C176CCD195
	for <ath12k@archiver.kernel.org>; Sat, 18 Oct 2025 15:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tTJZQzKPDxO/ZOg051psoNPOywl2B+7guIEa9xKApMw=; b=oWuzenqtRjqubzrHSysVKKUsn4
	/o3rRvsD7Kuq8HgZQfsIKJdQvEH1RPqBsMQORL1oCmEJ2+qDHFOXa5I/AbTtweEZsPrZODm5tlLwf
	9Ujw4qRDZ/MxvCeUZGWVBauLutrk1GiqZ/TQwgGhXVUFRo5Iyikfbkk87o71O2Jl9kOAxSQkjQzwJ
	4j4h0J1sI9Xox/BFyaxzPzBeFJOY9iiFvqMAUwoLZP+DO8bqr1WTEa+tUmH0bGMR9Pt4SegSKewZc
	3ij1jTiPTNcdntOfvnrNlRhV0oXRJ2w9Ul6XxYjweTnxwaq/AB0WxI9VPtUVN+eliTSGJiokh7ljz
	ZWmEgZIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA90r-0000000A5sI-1ad5;
	Sat, 18 Oct 2025 15:38:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA90p-0000000A5ru-249k
	for ath12k@lists.infradead.org;
	Sat, 18 Oct 2025 15:38:32 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59IEs1E6017315
	for <ath12k@lists.infradead.org>; Sat, 18 Oct 2025 15:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tTJZQzKPDxO/ZOg051psoNPOywl2B+7guIEa9xKApMw=; b=ALFHQtyO9QLI3zZf
	C4jR9dlz4bk5ppVM6lteSsO0ml2VbzLNHs1Vxrn7VDKKYIOjCOhyP350iV1dUbTc
	Qr8sb9mcI7gn7H8SvmWtNHGskSPvgL8kdLcBjWWKsYBsRJXHvLGm46Y8zneDvSOF
	jc2EVwnPDD2LVLyD3eSXUnRP367+j3JyWO9++BuC3B6nWgtzF7sk1SeJtrRr2/dh
	2LE7kckEg3+xVbQnN8y4C/+h7txQhKwZJwSwc6Go4/WozKUaC3H0WX99Zkgtig/l
	KQ2Jqhib3BfkgiY58o40hAh904rQTfvq0vZz3zsiO/EDppFYyA1Mma94dxp1gjT1
	Jda0PQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27hs03u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 18 Oct 2025 15:38:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-28a5b8b12bbso65966405ad.2
        for <ath12k@lists.infradead.org>; Sat, 18 Oct 2025 08:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760801907; x=1761406707;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tTJZQzKPDxO/ZOg051psoNPOywl2B+7guIEa9xKApMw=;
        b=sLuCBYtgniIfqGBFzNBtWQ9I9pL3ex0PhSFTeSrG2ksLpp1yvENhrvYJoftyCkf3gE
         B2+Z4MWpGLKzz3+Yc+lNNBWQIEKwB8oqpDkoyeO2iGHkO9bPjfU6uERDYK/EiyZV+CpS
         yYPHfm4u1fgwA5i7rbDMJ2bf+BydGimoQMis6A40OxRNNW9SI/k+F8DTeTM0tgVUYk0W
         rO+jeHYfR4c6FChbWicmLHM6Nhso9uyjaLPo198qFTTsmpFetp7PpylMqbmm/KTdIq3E
         0WEHpNSNlLZsL+W5ENoKXl21duHCtKRTlOLE8vpTFSkk2ZI78PVG+qb2Q1f8VOUte119
         P8gw==
X-Forwarded-Encrypted: i=1; AJvYcCUr/8y/LBwBIFe/cLLNTMqguSjyTgdmVMBWj9CK1AP2iX6z5Z8BP6+25vbnEpbgVXBE8hJCwgs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwmharMF/lHqlfey6ZHsQN5kC8eHtJ46+EACuS6eD3oX26BEzo7
	3kyeEOIkJk3dekWFHDeZyk3iA+N/9X5HD0VwjTWw60y8+31XatSd6yJtaydSWTUqgr+WbGW2Bw9
	1h+9h+2V+JkJhOpsQmK+Y3S41hHAawoZh23e9EHGxJiGTGfN6KwLUjouoUniF5ApWgB5aABxj
X-Gm-Gg: ASbGncslvgqLMedWXVj5HqEDG3iG5O19gqkGd8Ux1+2uYDSNWAxnD9c02g0UhpgGHaI
	4Do8uCxzLs1wCRCQlCJpdgKl67OEm7OxW2PlhFya9PUSJlydW1Hfn9OphZx/uFQRXUoOiddEShU
	jt2pHPNXm9x/agcGVjamZbkaAUVSqrwVODE5jZ+hg11Tcp/tKA1zsRlZ3FtzX38jnChQwxysNOZ
	OAYWLksqKpEXvnknffrT9610qwW/TbbdvZ86cS/TBWgV/FkkmTDftIe00eWnqJHyN1Y+at4c2Lr
	d/iiKqA16CM/rNKT81Qf1J1hEnE17iXjs1ucXz490seit5/N69m62RjJpjvxDgX+peF9Ww7FmD5
	x/CqDXQK5NPB1gvy+jZvj/WIh+xiZih7JNKo=
X-Received: by 2002:a17:902:c943:b0:290:ac36:2ed6 with SMTP id d9443c01a7336-290c9d1b907mr106269975ad.14.1760801907600;
        Sat, 18 Oct 2025 08:38:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB3O19xCI68MiNuktLQKUvkcvzqeLpea4bfKPkKFnzOz1BRXIF6Sf2snzCwqAohNlPYTUtzg==
X-Received: by 2002:a17:902:c943:b0:290:ac36:2ed6 with SMTP id d9443c01a7336-290c9d1b907mr106269675ad.14.1760801907170;
        Sat, 18 Oct 2025 08:38:27 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a7664a228sm2999109a12.4.2025.10.18.08.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 08:38:26 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
In-Reply-To: <20251003082955.11436-1-tiwai@suse.de>
References: <20251003082955.11436-1-tiwai@suse.de>
Subject: Re: [PATCH] wifi: ath12k: Add MODULE_FIRMWARE() entries
Message-Id: <176080190653.1665595.13835656196130660579.b4-ty@oss.qualcomm.com>
Date: Sat, 18 Oct 2025 08:38:26 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX9o0zKJTrT3yJ
 h68hynptk/eRkC4mp12m+5TEvmQB+gcEEhfZhL+kOE1cneSo3749bHjPL35DlHq6tzrRP80qJip
 GjTDezeQugDf9XXJ+af9xKk/Y8LhQMaKArSe0GfbBrOlwLvYZwzXfSdUSM9qTUlNXk5GXpGMKbo
 ItDivEzvNJb5uFzW2xQKHN9B0BZ0S72Eo2UeT95PuDQUd0rHBDtbZ2ArGhyVGQUBnAKO0NI59Y+
 oDTZQK1NpwGuE/xZmC+4WXDh58EhwVk9W0fHjTL9sCqJQEWF5tURwLCeAEss+kujUi9eubFnenh
 VpK/Ec2FDkfSBeYfI0wPnwuSYbqG919NS4LXUImArzWoLLcxD2ZeIOyLw7fAjWT4Gyjdss6j6p8
 KpdXy4tjYBzyYWTHYoiy919+NOHIhw==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f3b475 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=eBwvleRBC9WfgbDsz4IA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: dH8MfLIMl1f_AJ3avjGvWz7EqX5Yf-_-
X-Proofpoint-ORIG-GUID: dH8MfLIMl1f_AJ3avjGvWz7EqX5Yf-_-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-18_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_083831_659710_BBF783AD 
X-CRM114-Status: GOOD (  12.14  )
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


On Fri, 03 Oct 2025 10:29:19 +0200, Takashi Iwai wrote:
> Some systems such as live-image or installer require the firmware
> information for each module declared by MODULE_FIRMWARE(), which is
> currently missing in ath12k driver.
> 
> For addressing it, this patch adds the MODULE_FIRMWARE() entries.
> Like ath11k driver, we can just put the currently used firmware
> entries for QCN9274 and WCN7850 with wildcards.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Add MODULE_FIRMWARE() entries
      commit: 38e3a9408496540f3a1dbbfc2ea7e495e14e03d7

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


