Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0BDC54F51
	for <ath12k@archiver.kernel.org>; Wed, 29 Jul 2026 15:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTEXbHq/KMfkEcYT+LPWhmkDHUWQdBZJ5ysUFXe6EdI=; b=j+S3JaUqsyNj7ZtR68AYZ8FYxk
	Uen93UZYx7h6To9SibA49RHQy1LClyHANg6bNMoRLbtwbyuiOc4TqqaepskwwoPzs3juPetb0hCK+
	lTEcSKrYd9J0e1q2wwYo773gO/Pw8SNuNKNxkkw4jkLF0DPXkBmS0U3y75xTyEJr2JOdlD0heqqVr
	Y5gcX4miwlCR7lpWQck84Ed1UoFLjSp7ZoqitDP1ecG60cwAqlBLK/CXS2iz7vMoKBRZi636kpGL+
	OjlcKL5cewp6zexhbm6/DGgyTwzE4p1+Zafgfl9ri+Lt4Z2WAj4qu/HxswYVAuvhGWAxuVGGJuUA1
	XbtMZjXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6Ua-00000008Rio-3e4W;
	Wed, 29 Jul 2026 15:46:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6UY-00000008RhC-1Sap
	for ath12k@lists.infradead.org;
	Wed, 29 Jul 2026 15:46:47 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF32lE2357627
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 15:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eTEXbHq/KMfkEcYT+LPWhmkDHUWQdBZJ5ysUFXe6EdI=; b=O9CcIpAiHNExmyC6
	HJvt4XlOoJ3xmCk9EJZGdUvdYrQ/GVQbM2D6CJrNHm8/k/T2j/2hwoOaNYxt2WbR
	Wvry+eYrKA2b4OAJqhhBoe6kpV8QwZ1LgE7P8U63JDLcYXZrldykm7hsh8eaHNds
	/U10rMHpQiP/+9/fJDPs9XcMUM2vaFv8wF3SczfjHqV3o+2xq4aeRTm87rTeD/9E
	4r84g4oY3lL1Sp5eg06Jb5SX1Aj9GK0IBS79/ZMasORvWyn9to60V19FP7fMZOMx
	L57BZ92Vj+5PEEGkceLziHmVOp+zfLFZfiJRZ2+K/HmvjcIp56GUmER/NIglGOQO
	jSTZ6w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqhe993ar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 15:46:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf1c86963bso72105ad.0
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 08:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785340005; x=1785944805; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTEXbHq/KMfkEcYT+LPWhmkDHUWQdBZJ5ysUFXe6EdI=;
        b=VmGTWQw8VC4bPN7T/Zse5jv7jqDeUVyiX3ezV5whaqY9DgVrR9pI3nabYva5h5V9Xt
         2xOl3U4/xw3ces9fvhrHppJLJZcozRoVCH3shRbgp5K6pzqVv26bjh8KVW9BannkSsby
         bRImi6YCyr+TB4A1SIh6aOcCzFYL/wMLrWTE6nzwxj4/xlkunuuG3MLpWORR1rrC4QVD
         a8l7GzMdOYgxkVgRsmFtBsphDNALybCPJBejDVMX16tI4y/vOJr93AJaZEXdin6w963Y
         uOo+8z0BPbD07VwRAsH5VGwdWpBsFjIkWrAtyby7ed4ACnSiGTCM1kp964YUgSvBsWWK
         u/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340005; x=1785944805;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTEXbHq/KMfkEcYT+LPWhmkDHUWQdBZJ5ysUFXe6EdI=;
        b=dpuwrYL5yuyMfBHKgPk+wF+NjlaCFb8TUfRHlos8ej1niSXENBEifH2Qy7Mu4ViQnx
         +4Qh4krjfaGSitxF96jwP7fIY7d6LzQT3LBo/Zj+NEGI0x/KgPXWNIRxmKEHAIoQm//t
         4fFngrx2oIJa/HO7XB5J94PLHy39mm6aoNtseEkoM0p5T+2hhBJNndMZdftJfiGPEoVO
         WWvRr+9MDfT0zS14GLIgTiCG6wtTPNJndlYcFE696nhU3xYCnA8vK4c8ueXc4WOHBF4i
         dcCJF46VzaNxXZzzyO4ogpCLnlr+dfbbcS0NEtQON9PdGgtc1uFyTDztSYelqwTsEC6r
         Fhhw==
X-Forwarded-Encrypted: i=1; AHgh+RqJaX7yCWbKbrkKi65SqWvq/LJoR7ZDr77Fjd/2Kf/Uc4tj33Rg1LPYft63ryGxr8fnBtrzsts=@lists.infradead.org
X-Gm-Message-State: AOJu0YwcD2yU4tQqOyfTCk6zTnbSxYelZoVvi/KabgfVSzzfC+MQHN23
	v1KxQV/lfpMIaPIGKgOXHgELk0T8ojU/mHfnD0qALz3cdFPj0twAaO7c0O+jFEeXb6qbAeN+crI
	X+RZjId9uE/shEcKaUYiF2GOJZf35BDw5TmAMvunQrhy3//oUOnlRC5EkkZPxCqwK
X-Gm-Gg: AR+sD1187e91C/GodnrdRgqn6DODykcR+ZmS2OL/Pd78F8ittbIbgGP1N76IfUA45VI
	REN2mcctcQlXUsXfOKZLOkYGe5WbRcGxcveoc9+1Dewa+C5wSieKpvDIsCS1ZkhtemyZPoBtmhH
	Kd1RaacSA4dQPMzOAoPos1acsyg7ICh09LDv0yQuMHnTSSd74uWCCB3sEc+yQeVjr321Cqlwuwb
	xl+G3PTGSHU/Xc2KJJni8Edrza+jqyNLB/XEqMeeOIWFKWk9yMWSx9lJBT1wkPju9fj0kDis01V
	EDLFaLHpULUOqTuP3a83wO7XJt5KxEP5YSKxroEpZklG08WfJqn43vm0E30XelcyGj5/EUJaPUQ
	LGEY1IQ5Wkl0c0s8Z49aT5MAspyQshrMEE0rR6BkwfTE3loDi3gviqVc=
X-Received: by 2002:a17:903:ad0:b0:2c9:d277:2cdb with SMTP id d9443c01a7336-2d0266ce46bmr27057225ad.9.1785340005235;
        Wed, 29 Jul 2026 08:46:45 -0700 (PDT)
X-Received: by 2002:a17:903:ad0:b0:2c9:d277:2cdb with SMTP id d9443c01a7336-2d0266ce46bmr27056985ad.9.1785340004812;
        Wed, 29 Jul 2026 08:46:44 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a76a5bsm13577185ad.35.2026.07.29.08.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:46:43 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260725-consolidate-firmware_mode-v1-0-aedff0ce0ba5@oss.qualcomm.com>
References: <20260725-consolidate-firmware_mode-v1-0-aedff0ce0ba5@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Cleanup
 ath12k_firmware_mode enumeration
Message-Id: <178534000343.2826154.1163759345155368715.b4-ty@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 08:46:43 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNiBTYWx0ZWRfX5zueBD7GVUff
 2YT83L3FiY3LCTi5YimVAz2z6xVlG82e2Se1MIuLt4itfvy6sVuL2pljHjIWk/5zMVH1Ml6rC5v
 +XGigtK0pVwjLV+VvhJpQR09KuW/Hyp+LCtkGScyzfuRgSxL4z6PRp/pNoQ0ARU+D1ueApWN8nJ
 lsmwAXbI8yN/9uYwiSCW1C0g+uIfV+4Jrs+xJapaJh8E6hySrlFVCErghJQ8Difo7vP8Lzg1f1z
 312YSQQc1p8SSOwsHwvxT13t62pYpVDngYWMMvbnVPdRzntMynJ5zgDRPZzMKA0UgfMoA+NohHa
 akgD5Q3Z8d55HpqEOFerqmG3fpr7/71hP/d1Z79hGL/Wg/ysvnDWlys9+kLECmIAeBWPjCY8YuI
 iPke+q/YdsdthCFUmi59k3yuuvXLBZGhqy4dVthHzXVbPS6d0m7mhNvUKuMZOf2yoVz5BJEHdqD
 dr+qUTJF5MgrY+4tVYA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNiBTYWx0ZWRfX4d1EQuFGpubp
 MqyPWvVl1IAUa3R+zUQa1FQZN2qeXNaKO7EjIilvrURYevAtXhCcnv5ZwRCbR6JQBCZ4BpraQwC
 gu3JpqNgaaVj4BSaKBj/NY10khuug68=
X-Proofpoint-ORIG-GUID: yihDkNWG8Kaz6lYiZI5CIYVvIlUJ_dJz
X-Proofpoint-GUID: yihDkNWG8Kaz6lYiZI5CIYVvIlUJ_dJz
X-Authority-Analysis: v=2.4 cv=EsriaycA c=1 sm=1 tr=0 ts=6a6a2065 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=G7SgPBRoAAAA:8 a=EUspDBNiAAAA:8 a=bRq12EJsMpg52VJJ_SIA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=2rYB-OeQH5pmQqQB7sEg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_084646_414247_FC850962 
X-CRM114-Status: UNSURE (   8.42  )
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


On Sat, 25 Jul 2026 11:11:44 -0700, Jeff Johnson wrote:
> This series inspired by [1] for ath11k, but takes a more comprehensive
> approach.
> 
> [1] https://lore.kernel.org/all/TYZPR01MB55561DF4543A0265B47A58CDC9C92@TYZPR01MB5556.apcprd01.prod.exchangelabs.com/
> 

Applied, thanks!

[1/2] wifi: ath12k: move firmware_mode enum to qmi.h
      commit: 0702eddffff1b637a9e90187785a0b44542bb365
[2/2] wifi: ath12k: rename firmware_mode enum members to use QMI namespace
      commit: 0090ec7ad252f1a597d782b7bce7eff7bdde00c0

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


