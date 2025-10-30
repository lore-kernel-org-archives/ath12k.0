Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78C5CCF9F0
	for <ath12k@archiver.kernel.org>; Thu, 30 Oct 2025 16:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtZc1pGD2SAm3gsjvDf2qc52rmp60R+hZ96QX8U8Oz4=; b=zzpFwKKyjPfJjIdQQb5XBfX/j9
	vwsQkEKDePtYx8SSxMcNAjtAUN0Ou9ZIShzrw0OhL0m3xS7yGiNICBWuSksOTyoXh2uVPWdkEt0OC
	k70qMfPm6CEGbCZ2rszGRFRObTXQUKUcy7WZuERSpWXDOTzsP5tZre66jXkxHXCXhPj3zHHPbbFH0
	JRg4Flb5YWzG+pg96mxLVN13IupGX8/FHBlyAvYx4kkkIk5PyoP+kN3bX+wHzzZbRyGiuL2JU4JDr
	8YcEvWLloJH5QNcKlsccGK2gksx5Y7ZUjXyAJNVMzEjrCCDcM0aINypYa3+0ZzuT/+aYzjHgNaLML
	GpOcWZJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVzt-00000004VbF-2vZj;
	Thu, 30 Oct 2025 16:59:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVzq-00000004Vab-3KYm
	for ath12k@lists.infradead.org;
	Thu, 30 Oct 2025 16:59:36 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9Q6J31994438
	for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 16:59:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wtZc1pGD2SAm3gsjvDf2qc52rmp60R+hZ96QX8U8Oz4=; b=ONpZk3iFuXFg0mK3
	GOHt6WkLWJekO1O/Qy8XJHX+bSA7REgsDN7ZMS3X3m4OI6WD1DVDGx0ONjtflw3e
	28A13NJv83cvr6O1JIQx6RSNEjSy5B3OdUdMVAuXAUe4u6iuMV09Cc29zDUkoO70
	zVi9UAzrugxHOwTdfxO5HPFlvDZeIQ2CBJLyfqjieurAAtM/kDcJHz81pVICy4M2
	aWFDBhiLi60qPTrY5t7oc1wJMAHcrlG7Qw4rWQ10RzlGWTLLyhqkW3jbEmI14GPq
	8AjSQXFS0x6SELDp4piW32sDQRVz46ZHvprCr9GIt8qXN4t4t6YxgKc07OqLen7y
	ZoZpew==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3wr72kpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 16:59:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-78108268ea3so2105549b3a.1
        for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 09:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761843573; x=1762448373; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wtZc1pGD2SAm3gsjvDf2qc52rmp60R+hZ96QX8U8Oz4=;
        b=fL0/uUA+D0BA1vfZ1TK1yxuYaf2FQHmARuQLyl3y19upPqSt0p8tVDtdb4Jx3FuVdF
         WjWLI+tNyYJbN+H0mw7lNiwhG9ZOj0JVUyd7AqXfL1Q6whW3q2HbZNQDthfAd7A0qv1o
         2zcIhYcokUhpXPCjzqF9vyj19gvDwYOXW1HJB8XAfdCvYJCa3HrVINzGiCYORnaf5pyp
         VvO1LJXQRalznQk+3ohbGw3tKU8SkZdAAr0WPlPizyB7IqimwdKCWzVG6cpizI+GjfXs
         8wNm6fcghpSZHJ9UPuFhcPlh0JL+/mrKlVbgNuomQU75/iNd1U8BzGIpxuzGHkv1yH7F
         dj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761843573; x=1762448373;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wtZc1pGD2SAm3gsjvDf2qc52rmp60R+hZ96QX8U8Oz4=;
        b=q83jv8WI6ajVTv5XQabP5vMqBL1lOOGbFWfp6lWvlVQv1FTiGT4yQIupo4TgKZD0zN
         pt0TPzbjPXT9cJ5vmNahparw4P2riilDYixWerDyGwCMKWsYrrFBnlCdNMKdeQHqOGbs
         bufwutNMd+8wbFx/Bj1lM8s2XYBSu2KXraGZBIC4UlYvax5OnnI02TgvBO+pfX+9TRbg
         XfptgLhBBErL81+ZXUSXWpmNNndRRcin5+MED1hiwAaUMlJJw+Z17XWq16ThgSwkjH5/
         N3CDjkR/wcW1ZwAciEZVBFMsNpU0tEhq+A4F+P6ONjekEalxZCR08V5Yp6dRtiUE85ys
         1iHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU6mmh0I5D5/vJcRRz5XAKhAd3yVm6s2b+dSEBmKP/HL/KPjqM21r3E2YTdPHf9sdaXlr7Or8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUBk94IpGCSjNhLoj6wckgdGITmWONmBpMl+82SrcI4RVdCtYT
	Pwp1puiEVyY9SOW5ksrPrnx8Se7kzy+B4OnL8cTy8KsYFnP7367wnhEH38bIvRYyccpEyvKM1uE
	Pr49EH7hf90TdSeiA6mQn9czxrl4FVfLeXIvNv68HF3SfRUVG4RBBcHQaezYUtmmN
X-Gm-Gg: ASbGncte9SgZCAj5vhGhe7iRVzV+gJiKM16NNwPIwtvAfmdG9yQgr7UIQj6k8400/JC
	3jIhRUyQpbwYRlQ7e8fWeK2zfaUok+lT0bFD/O4rUm0H89tRBUbz++QU66ww9AYu5NhNvkHF0A2
	4QncEvi5KoAAzGrIMXOoS1Gy/977VZKJlsbYnAhuRMd2/pMVJnDAWDkQ6oPbUAcyl9yPzjXo//Q
	ek4XRGYIW30Guslz+b9ESeL52MQcd6AV4fhBaXLYImSZjTEk3f+5+fJutyB8nzD0OhHVYGZdSc6
	lsWHld76Ix7n0iDSqdtRmucHKyECUhfzfKEvJnd6t0DW6UtFZVzu9DpuxwSTp0rt9At6ZTVpABr
	DubZR7Sj3+PrOrL4JE5HjrTIFmc/iXWgRGUn155EutKBcAV/G52E=
X-Received: by 2002:a05:6a21:e082:b0:263:57a:bb46 with SMTP id adf61e73a8af0-348bac647c7mr776419637.13.1761843572611;
        Thu, 30 Oct 2025 09:59:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExxueTBs52z1H94z4qxfGgGfpkQLd9sFoz3+QBkDeOOi1CzX8t/saF2wSQsaEfqoUTLon0Rw==
X-Received: by 2002:a05:6a21:e082:b0:263:57a:bb46 with SMTP id adf61e73a8af0-348bac647c7mr776388637.13.1761843572110;
        Thu, 30 Oct 2025 09:59:32 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.207.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414087587sm19170760b3a.58.2025.10.30.09.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 09:59:31 -0700 (PDT)
Message-ID: <fb6265b9-a858-a266-6565-59712fd79306@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 22:29:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH ath-next] wifi: ath12k: fix error handling in creating
 hardware group
Content-Language: en-US
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        a-development <a-development@posteo.de>
References: <20251030-fix-hw-group-create-err-handling-v1-1-0659e4d15fb9@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251030-fix-hw-group-create-err-handling-v1-1-0659e4d15fb9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE0MCBTYWx0ZWRfX1pOVxrjVAUu1
 3rnwx6gUpNCd+8aLLoti228/yTe79HTEcAS40OrL2QiHFes891m8Of3fKqn+wfIuofSkkH2eGAa
 cIaGjQ8WcbxPi0e8Fxg3zMKuskvKRScGR8dFEam3EarSAaWlqBs2qTTJwRt5xoLLkxJCwbUdDQI
 I37aXRZ+ek0AJGOedH+5im+3HDa30PlDLa39nJ7d94mrAGlQ9habmmHFE+zovxZqxXno/Sx47t1
 YFY6leHazk1n0c9tBRg2NhueGW7bZmpLAqF0EslQy1SQ+2BNXdHex/UqqP1HxzvHHc/95KXC24J
 6XEeaoODFWXZ8Mjr90P6RFWL8qG3zSnsOZekO+79az0B9FT7DfzgBHqCBmIigQJr7/snsg3M8dX
 sm+ZqMJkXpPSfqlM2BeFLSAY5faobA==
X-Authority-Analysis: v=2.4 cv=P+Y3RyAu c=1 sm=1 tr=0 ts=69039975 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=CMr6UP9dfYAYc02HN5pMZg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=uChsZFC9AAAA:8 a=EUspDBNiAAAA:8
 a=a-WxQxKLB2PsUy-Z31IA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=ULtXvzFHYWHLyBAuiDia:22
X-Proofpoint-ORIG-GUID: ZFzn00om-E4iaA1khwSh9qU05MLDoXuo
X-Proofpoint-GUID: ZFzn00om-E4iaA1khwSh9qU05MLDoXuo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_095934_967498_32DE4295 
X-CRM114-Status: GOOD (  13.99  )
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



On 10/30/2025 7:38 AM, Baochen Qiang wrote:
> In ath12k_core_init() when ath12k_core_hw_group_create() fails,
> ath12k_core_hw_group_destroy() is called where for each device below
> path would get executed
> 
> 	ath12k_core_soc_destroy()
> 		ath12k_qmi_deinit_service()
> 			qmi_handle_release()
> 
> This results in kernel crash in case one of the device fails at
> qmi_handle_init() when creating hardware group:
> 
> ath12k_pci 0000:10:00.0: failed to initialize qmi handle
> ath12k_pci 0000:10:00.0: failed to initialize qmi :-517
> ath12k_pci 0000:10:00.0: failed to create soc core: -517
> ath12k_pci 0000:10:00.0: unable to create hw group
> BUG: unable to handle page fault for address: ffffffffffffffb7
> RIP: 0010:qmi_handle_release
> Call Trace:
>   <TASK>
>   ath12k_qmi_deinit_service
>   ath12k_core_hw_group_destroy
>   ath12k_core_init
>   ath12k_pci_probe
> 
> The detailed reason is, when qmi_handle_init() fails for a device
> ab->qmi.handle is not correctly initialized. Then
> ath12k_core_hw_group_create() returns failure, since error handing
> is done for all device, eventually qmi_handle_release() is called for the
> issue device and finally kernel crashes due to the uninitialized
> ab->qmi.handle.
> 
> Fix this by moving error handling to ath12k_core_hw_group_create(), this
> way the issue device can be skipped.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: 6f245ea0ec6c ("wifi: ath12k: introduce device group abstraction")
> Link: https://lore.kernel.org/ath12k/fabc97122016d1a66a53ddedd965d134@posteo.net
> Reported-by: a-development <a-development@posteo.de>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220518
> Tested-by: a-development <a-development@posteo.de>
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

