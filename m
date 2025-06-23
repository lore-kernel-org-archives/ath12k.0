Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C1FC7EE2A
	for <ath12k@archiver.kernel.org>; Mon, 23 Jun 2025 18:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eeN6dbR7WLq/Y8XjMlHe0lEdqr+IJWA4DpQ54P3BxqQ=; b=T0vm0PQ1D47RBj4ttqCOg86ZOm
	spfeRVE6uiiZ+06D33boyHQlm4TBij/bYGYlxikbBZigbm16lco7ZECgje4WkJCs1fY2ZIKkDpl2j
	6/oBGTLyvujsmU7FhdJwfzMLwMGKnjKPqzaj0xMi/YmzxvNVbVK+ln073BxSiObrXianlu3LYMHnA
	0zwcwg5l3hPFQxFiHcf9mlqnOZFJ3S91rW9I0yKALcHZbJSTdXKC94WSaXiO0EiSr2v8gCgvnd312
	BW7fv7wAHzHMEFxq6zvgpNpLCjlW9PxFEDLPUMNsD+3OfE9QL9UJc5VeBLVWwVHDlQb72T+mQfkI9
	pBE9/FlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlzg-00000003hDD-0c8q;
	Mon, 23 Jun 2025 18:34:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiTT-000000036w9-1foI
	for ath12k@lists.infradead.org;
	Mon, 23 Jun 2025 14:48:44 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9Bjph028706
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eeN6dbR7WLq/Y8XjMlHe0lEdqr+IJWA4DpQ54P3BxqQ=; b=FPQiobkrfKDumZJA
	WOp2SOVlkCa1Cxy4Ex+qJdTveNvL6XqDQ0jPRfDeeM6zIEzVCafFvdug03CsRh0g
	LO87lm6xjWrQVBOnRlwhJWtnzjOX9Pcq6QHCFxNPdecHr5ipPpRFBPiLBdmxy5vL
	OJt05Vc8XJStkMGcaTkfvSzSI8IzJew9+MWbnQwSpKTJBLIneDYzxZCvnmP3yjTj
	YvIhAyRoPEMrZo1pvnnc9lU3m0keFPumloIKCW//N3MBl/XmZvDxlAGhRVaSzcAn
	NzTcDT/MmG0Z39KipEu6rAQ11g1lqwxjku2zhbbzwP5NhUM3IiicVgm0sOcxIZ2O
	/XOmZw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4jats-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:43 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7377139d8b1so3296782b3a.0
        for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 07:48:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690122; x=1751294922;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eeN6dbR7WLq/Y8XjMlHe0lEdqr+IJWA4DpQ54P3BxqQ=;
        b=AHrdv5l0JNtcmR+pp88Wrr5/ALWGJWhAos+iq7SpEGmWSJY/b8r8YfBjm2KVbZdHdL
         qlBH4ROXq4LLM63FIqD8qJgeVeQjtmkWLj0XPCoeiwC3HaLF8FnUv/6PBl7OVz3f6wFI
         QFIlGSFpCyK8712HmTMokns6B5VteIyzz2yM2nrATF/yzAQlH2Nco7ljFkiPKzEhbF89
         5wJl6b5LAePfUCA+nyymX6tedRY8ZddJLmLo4qPjjodqiNvUg2sLvLuWP9RP9YbLIAY0
         tXR8VS9JXSAy2jDZYKM2+QsBM5N2mSLoh0mFydJLi0B7XwlLX8328GtL1+1AyY49/ata
         LGyg==
X-Gm-Message-State: AOJu0YxAiZd6XfeUghDADZfn2jAaS0e+nz7j62pR9tYxFhBI3KH0tHR/
	qMCgLeZ3CvIG7ETran079uwjjgRzlGrZPw/AACT65oS7RbYNtHRcC2wfJFBMbvx5Ind5w7Np1+A
	6cvJQxszuPhwBxZbSaayOEGoaVxn0hJu3tSAPOU+XS0/l6ggGTzistIwA5rkNmWK9
X-Gm-Gg: ASbGncvno5GITqE7bRI6NI8IFLnEwBVtds5DMda8mbaKwakuHwOfjFkEY8GcqLhaSiX
	uy/Gsf9vJrZRYLeCi1HiP3m8/sMU5CjciC5NpON84ZYkIEuotCDCURn7dvBtV+b3nnxUG6nLmTu
	vsAqdX5Psrs1UvaZ1mQFFptG4Ut5ow8r6M1TeLjnBJrNVQddfsZRGVX+s0r5XrV8slG3qKL3AGb
	0Vmw4425figcIGnURlm3WzB2/8r5iZXLp0reGqSG3mwOlubQEnqeIQl3mCYbnrY20TaBYy4sYGZ
	5nR4QTLVJuYFJXzMqoozyd3np9b8X9xCl9/89Y3Bh1XTJeUMVVT4BbAu9Ks=
X-Received: by 2002:a05:6a00:b45:b0:749:8c3:873e with SMTP id d2e1a72fcca58-7490d7b04camr21575016b3a.24.1750690122123;
        Mon, 23 Jun 2025 07:48:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfnVhqUnLt4byb8wRkprQr5LEHe+XwRtowo9JdW3xu0OCncYW4Es9uCwFTZgxmEkzD69xseg==
X-Received: by 2002:a05:6a00:b45:b0:749:8c3:873e with SMTP id d2e1a72fcca58-7490d7b04camr21574988b3a.24.1750690121656;
        Mon, 23 Jun 2025 07:48:41 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6d1eccsm8332894b3a.180.2025.06.23.07.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:48:41 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250507194832.2501668-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20250507194832.2501668-1-rameshkumar.sundaram@oss.qualcomm.com>
Subject: Re: [PATCH ath-pending v2 0/2] Add split-phy scan support in
 single wiphy
Message-Id: <175069012091.3758471.9334138851766473915.b4-ty@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 07:48:40 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=6859694b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=FXeA3Vo7u9djW6XytVAA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 5T5G6JVepaT1Lb3FM9_9eRxaB4HW5BMq
X-Proofpoint-ORIG-GUID: 5T5G6JVepaT1Lb3FM9_9eRxaB4HW5BMq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4OCBTYWx0ZWRfX7OpBA1wXNdGT
 ZDGskxzej1T1nA56Jy/B5iTIfy58kpanISn7t7NoWJrf9d5iK2XNr4V3lmbcPAviGnE3fzB5xP7
 5KhKCk/Z7pPs9MbB7Sf/UXfJw8Kmuoma1Pu6PBrWEY6CkQ+FL0VDHRnrrHtghao3q9oeiMLSLvQ
 ZyZLAql9hTuzkUVX3maNvs2oNzPlk1yIJKfGBI9s4CUCk0yxXcEazOqu7Fk+Ir/2iXSWoMYg8Up
 jNGTIpf8BsJhuaTpA4SVeoY58AEZq2GRw/vcmgy5AEwFEq+eycJEqLuSzKOXrTC0dFIdFuZVXgz
 2NA/BN9CkdXdQ4CgietRQQA7nl1kL/KUonlARosuPN8efb54mApJ9jztZu+NhUX8GXhA1AKnFOa
 V8Vihe9GlTbE0cdH6romp+OQlvZQOF3j4fVadX+3z7XjETj/O8DYtt19mFZrP8OASmqtl+1m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_074843_444467_01749F43 
X-CRM114-Status: UNSURE (   9.23  )
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


On Thu, 08 May 2025 01:18:30 +0530, Rameshkumar Sundaram wrote:
> When two split-phy devices having supported frequency range in same band
> (as mentioned below) are combined into an ath12k HW group, they will be
> part of same wiphy and hence the channel list (wiphy->bands[]) will be
> common for all of the radios (ar).
> 
> 1 - 2.4 GHz + 5 GHz Low band
> 2 - 5 GHz High band + 6 GHz
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: Prepare ahvif scan link for parallel scan
      commit: 14c7d7eac1bfc29917acedb894e09dae6c00a014
[2/2] wifi: ath12k: Split scan request for split band device
      commit: feed05f1526e81677f508b026fd2d66d178f65f8

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


