Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFA6CCF9E3
	for <ath12k@archiver.kernel.org>; Thu, 30 Oct 2025 21:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUdNvRosN1UkdRWaiq4PTrTJjx9avzZeFXnIlwSgEMU=; b=rROkiid21iAkOiJHXnp6T0L4UA
	qLAk2A3JBvYDdpqGLaaLnBCzcUe+w/ddYb8lqIxAHrmnkkVOQSifJcpx9B2/ElxnOeQTQw+MKbMa8
	mDW+Yr7a8CsWL2NjGS7EUPIvXeuVFZbMurchO3g3WRVTtcDD5cWePtZKlcZwfUiVSg7Q7S4Acyqy/
	bD1pzU5EJOl7R9IQZRW3xB73efL4D+aI9QovSCWMLWwAug8E0klGEDr2DApKxmdLRritOWwFweviQ
	rsXKR7DzrLh8hNvbifX/VlLv7vnn0pdy1+/i0pBxLtSPm0pk8Cq1OHhqPzIDvLcYam4ydQnW5i+vl
	z/v8z4Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEaeR-00000004zoa-3tq9;
	Thu, 30 Oct 2025 21:57:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEaeO-00000004znd-3053
	for ath12k@lists.infradead.org;
	Thu, 30 Oct 2025 21:57:46 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59ULBwua872593
	for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 21:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YUdNvRosN1UkdRWaiq4PTrTJjx9avzZeFXnIlwSgEMU=; b=Qg3TmO2TV7FWDtUf
	16Bmo30wgPFmLrWdFt1M3WMivYPMrmdvTZ8pf3o6EXFiFfhxQE9Ndxh1bYLoYEgk
	QwagKRdPRc7WsmkM6j+2wYn7VC0A52uct3FjurkQTGwM32U6JE3lswY7jUMk33d6
	iXmqFCTUhaiSIJCUg35SEcVEI04Fa0uWwWmsMiZbhJIuDkxsgDYlGTMNq7Bbkeup
	I+WeuBcloyyu89ZHzqZl3ih0k9WS/iyBE7ZJVwg7MRVigmLKC7fLBedqtqaphPKY
	8E+Rl32JYWJGrfA47uN9Ylv1DDG2t2Y0hJ+xfkC2Ecw4C+SpH6gc0DBFB75N9/jy
	9LCBLQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4fqn03an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 21:57:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-290bd7c835dso16457105ad.3
        for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 14:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761861462; x=1762466262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUdNvRosN1UkdRWaiq4PTrTJjx9avzZeFXnIlwSgEMU=;
        b=El8BgiY93MefgJv/I3DqZc7wsyohBYSGzobEsPrSqyUBL2kZNAmF93gAaJ3SLhN2F2
         Hr4hzeea5X8zP3jUkmUful6Vwpsvsk/t5/7yrUEgsn4V4gIJqDnXD1UrAVt/0srwl5oA
         b4kzmLQYuhlMmjfwlc97DcuMUncbgYEHs9/WdyIKrQAeT/UFeDpWIdPNq11PLVsjwAUn
         EVnPWuBwnytbSW7i99NHIU1Ajhbk59tr71srL2/4T5wp7BqU866lCj299ty72cgcoJhz
         1duEOGE/d23D9f6wj0EXuKJXoECvr4MjJELmR4k2ys4QC40VIZisGvJ0iZCNRhv/ZZYj
         4zSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761861462; x=1762466262;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUdNvRosN1UkdRWaiq4PTrTJjx9avzZeFXnIlwSgEMU=;
        b=sxevDqkV1hUbRALeleOmZ/DdQPqUjj8UrqBFZydh32iHrxGiFvrNL+qKCksylo7b5F
         es32po9enMlDF5DyII9ACEm5PO4KkrUAxc7munFBnHMbToxVviR1O46HcXH/D+JbICN7
         f6ucqwJcD+UiTi7r+ge02DXqRGHwQnA4xuxa4l9y4mbx/MELTIx1s5M/ex7zfycyArzB
         qHTESw/wExuelqIoT2G+m3smPPfRTNhdpGtgMzNHmAwzGMtDeNnQ/r1+P6bqwGFztbN3
         ULhf9RqprxmhWHta7KrIRXGQS7P6etZOHpBr0Cz3LdZJfPW3V2T7lXeB6txIp7XZDt6M
         sJ5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVka6FrM8vVNrWTF/vxg1MgU8zd9aA3xLzSsPVMWcQCJYX+jkJ6abj+RqkCPTCy58IFLHvNqkk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzgxotovThgiX1uIHXmyKvcJ9QGqc329bQWKHdko2stlJQqKtTX
	VklfFsvtlCAK3r9dQbxRVTW+JbmyKFqO7nyK7cUioXhMIbMw28plAR/3RkXoYezl1Lny1w+Esxw
	G6+QnLpmLrGdnzJ4ktP+dR9G/syM8K61eQ4JtZ5dkyate9ZsAcocQcAd7jRssPNSMEUSQpGEd
X-Gm-Gg: ASbGncuwqKXeFdNX05crqbQ7bg+PDb2EBhOYEq+vPTHJV1WQuGUJWVmI41ZiJsgwA5N
	Z8FAzs3CqnUflKS188YjWvaBn6piCzOoBwX5hOs8Gkh05hSYMAxGKw2MZG2GKc9yjbdUKesyVHG
	5bVnIOv8NRpnYJ4i/N63H0oeudlWUtTZlHxH2tEVxBVOXJlPM6Zh8QVsDBggJ+NbfmniRiag9G5
	mXE41chiR1KIf1EGZZwyuRnBBEmMlL/W5GTg8qL7Uo8IB/v21O6xvTVegfuGMB90WREScwO9hyW
	qvA6jVp0ibhZ9Z7bnCTl4SbPDVbEvIwTCsbhu6DNjdKcQa6HULTUhlk+8lDCMxNkZ2rSZTZfCfV
	ihAbEuc4R0q88c2bP6K6GjjpukWOiXMiWUqw=
X-Received: by 2002:a17:902:e414:b0:293:97f:208f with SMTP id d9443c01a7336-2951a4f6c89mr9818445ad.45.1761861462190;
        Thu, 30 Oct 2025 14:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2kZEJgbdubt9KJFcBXfENCGNLUQuQjIxSGUSn1+zhnUqkD6WbOql/ewdQJ8/XXjIIiZsj7A==
X-Received: by 2002:a17:902:e414:b0:293:97f:208f with SMTP id d9443c01a7336-2951a4f6c89mr9818345ad.45.1761861461717;
        Thu, 30 Oct 2025 14:57:41 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf4a53sm201868405ad.6.2025.10.30.14.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 14:57:41 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        a-development <a-development@posteo.de>
In-Reply-To: <20251030-fix-hw-group-create-err-handling-v1-1-0659e4d15fb9@oss.qualcomm.com>
References: <20251030-fix-hw-group-create-err-handling-v1-1-0659e4d15fb9@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: fix error handling in creating
 hardware group
Message-Id: <176186146100.3489476.15112650202285878090.b4-ty@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 14:57:41 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=RL2+3oi+ c=1 sm=1 tr=0 ts=6903df57 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=D4pEDFDytygc9mKA3-8A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: thTssztcd1X_PL5AXdLocUvYXw3BZMLH
X-Proofpoint-GUID: thTssztcd1X_PL5AXdLocUvYXw3BZMLH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE4NiBTYWx0ZWRfXxgX3UykdAstK
 Y6Dtx9PIyZYUhFiqiFTfId/9zzcSuhvmtblnmbmqUwqBdzT42aNIt5WvcdgmDcJeb/HehKddblB
 caKLcmrA9Kq5MNNnGkSKxF9GpNmhaD4vXM3oqibKQFSGgI5OG+3tc52/O5+15+k1DTgNwAAXjI9
 qGCp2l2Hi3dd+aO4SyqATqs3vJK2tTweN//PZ0iN/iQ5DQLvQ+dtI88lyqTitOYbatMIyGAG78T
 dHbkCHjBnR9XAyQWgYDJzQZdK4ge7ni6dYWD/NN+pcdi3HFLZY/XdzHnTEfzzAoDOHB0yAJV8h6
 kCYPkiK5n2NvYvbOfpX7RncvPHWGkMZY26KLcI5NcQOEmeUuOdkFz3HoGA1Gn8zKOSNiqOS4a9A
 gRqAt4Chmv2TlvNITHX3EvZwGE+MQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_07,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_145744_764857_AE5E0D01 
X-CRM114-Status: UNSURE (   8.12  )
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


On Thu, 30 Oct 2025 10:08:43 +0800, Baochen Qiang wrote:
> In ath12k_core_init() when ath12k_core_hw_group_create() fails,
> ath12k_core_hw_group_destroy() is called where for each device below
> path would get executed
> 
> 	ath12k_core_soc_destroy()
> 		ath12k_qmi_deinit_service()
> 			qmi_handle_release()
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix error handling in creating hardware group
      commit: 088a099690e4c0d291db505013317ab5dd58b4d5

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


