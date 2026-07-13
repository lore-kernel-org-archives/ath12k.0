Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B804C43458
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 09:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTdBr1+Sl+tJLVlr8nhC2OCra9+bjTqVmnJpVzYhVg8=; b=19oawycvpyPZlTZClGT8uXkj/Z
	e1tKB6sDVdJeb7qlEEngh2LXU9AFD+CjrtDQUuZWmcTP7rM7nf3THms1zh1CfM3zaKel2b/R9+AbK
	7N3WGKWbJgGfIrpd6C8Yg4HJuSLmuoPcY2RhwiLMnsS8Q1fnTNv98VosZGbw/2Vrmd8Hiww79+ug3
	0uH63mtGTUAVYNe7O15uXCT7o1tpeIyyDEhuiV7XzKG4M353gj9NF+b1aKAIfRzxZpXFhebhLmc6i
	EjF8QRmc8ycCqxB05yUo7TLp3SOCOLXOFuTi2O5sLo4qbSm2+2bMmoNawzG5klI7dFzLfClEWzQJ7
	49OWPObg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCfL-00000008fju-0lRR;
	Mon, 13 Jul 2026 09:09:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCfI-00000008fjO-3ZRq
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 09:09:29 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D98nrv793089
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 09:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rTdBr1+Sl+tJLVlr8nhC2OCra9+bjTqVmnJpVzYhVg8=; b=lA7xPbwb/8NHbDrh
	5mYjOraezw3xhLTwMANDboAfMMjrlgg9Jl8gKknojQGNTu/QCAtK1Co//8/93+4i
	TnYvT65fsDDogGDE2qnZeSc7SYb7W2BGcBTxxZiXDf0VEBRGZeE14ieIvjYcaGch
	bmlFiiOCfCyB6lxTAmeNAfOrCCi8R0dWd/b2UUnW1TPc8Uykz5Fx/wogTHzJCb97
	DGo3fXYX4GiJ4wkXdKwXcbM9BQa1F8DL95cqkmQifCG9nNT/It9kKE763hogFCyG
	1riyyK3Av+nDkOATQUyWmHjwF0NIhMDFl6BDaF/dbJPW7/D897mIxJPy8+fUECyn
	cvLMHA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4qr02f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 09:09:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c7f385887bso72660295ad.0
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 02:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783933768; x=1784538568; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rTdBr1+Sl+tJLVlr8nhC2OCra9+bjTqVmnJpVzYhVg8=;
        b=bc12uyjc5Hew59JYOT2Gpu7X0DFdZFdzV3UYK2qQntdEq6xpxbn6FhE/d4iXSrBp4z
         0TUEhdXHGpdTsqVVV/tPy4JkoSUIJ5+4sHY6tOp2Kt7ld/qBGYvEX/9yDb1YyUAq01FL
         kXWsC7WlFA+cy41c2JFiIaIxW5VWxxfGUdB37M0aPBiKmQI33NtI78kbc5Dsgfhjx9LM
         XIk+7Vq299/T8O76fjuSKqqGuAgw0udGb8TfFcU3TPKiVRa5ESXNvpcbovbPaUl2FCh5
         x9Absp4ao8xOoJjNkjLQWt1lAteW7/Ay3PvSYrqe6RdLJRbNhXOTyEAoSPxcT0bfXthq
         InKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933768; x=1784538568;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTdBr1+Sl+tJLVlr8nhC2OCra9+bjTqVmnJpVzYhVg8=;
        b=IS0OB+yXFZiIN/GXWimVIK7QQouhhdONQc0HKHGjtVtmN/aVrxmq+5Yj40E1d9NIQY
         y0UUx+PLpTvFJK9zO2W3kFKnMY7znWWmJyBx1nxYa0Q8GrhXJO4kkHhSxkFPGaMWuUGR
         ++s74GZpDl2fgVnkaQQ6EY/4fNHmswQ9Ra8we4InoNFwoPLf5O+m4wQYC/EWSWVeAydm
         pCTwPSgiZFNKep3aDamx2Ama++emKas7++GovhkunpLg1zn90unAGvGndAcmvCq8SBiY
         CWbl47TkMxC8SfNoJxXwjbysaf5ZW9Mr5dd+jkbxMWZipWHb6zYjAjZktMeuWVNvcIpg
         51mA==
X-Forwarded-Encrypted: i=1; AHgh+RrOM3G5Z324JodG+5agoWJJT3Jd7D6EX9lDwwskz47uvJquHzQYFQ5Oi9f4OvE+U5TYRYJYVAU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/2iesHLIl3HLuD9o6l1LWe12gZg/pY8eiXWA5tkeyeC0M5dOQ
	5Y0j9FcbFyhUdEb/VmJLVnzK7mGT145mQGHRxmYUsGCFS4f8AEx+/Yp6lyCe+uXUk0LgnOLy5Co
	P9L/eXUegZMZV9Lpbe5hbV7x8NjSNtgI4KuDMwlTTU66V5bGD3EJak/9SuUJCtKUF
X-Gm-Gg: AfdE7clX0VbJSePVU2GICGAK/qAd0QcXsdjfVpH4aTgUVtNpjmBNhf3dKm4FdHk0xZW
	jsZG22EBGh/RC4dwfLnV3IC8plPBWKDBZ6YW1oS28PHRIZ4Hdz8f0MJAdJMPJ+PUa0K1VhUcIYK
	1dIpwmH5taHakR/wVfitVNu19zLOCcI/nPZJi1wZKq+mbURAXFyf7G6J+1uguHN95szBJvs0si0
	IwvdWXsAGCoyUN4pflOQ1V42/N5JVMx0wjNwJlU8YQBW8Tvy2U6llsKZKpI4yx6Zdrd2fIo13hN
	LRiIYuhH4Xaylqv2L3e/xPrjyRYUy3GnfFiySSFAnYVKYU1ps4dUCr1IF+b2Jug8R5nSGSF4Qf8
	PBdGC78K4KC0h/li0uW4MfMTuISpwbc2wDIg7LydHnUGNcjOJXF8=
X-Received: by 2002:a05:6a20:729d:b0:3b4:888f:b3f7 with SMTP id adf61e73a8af0-3c1108cf4acmr8256083637.42.1783933767626;
        Mon, 13 Jul 2026 02:09:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:729d:b0:3b4:888f:b3f7 with SMTP id adf61e73a8af0-3c1108cf4acmr8256069637.42.1783933767216;
        Mon, 13 Jul 2026 02:09:27 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f72a6sm80168725eec.1.2026.07.13.02.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 02:09:26 -0700 (PDT)
Message-ID: <cadb2c3a-070d-42bc-b19d-a10fd2ab7822@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:39:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix ath12k_wifi7_mac_op_tx() style
 issues
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260711-ath12k_wifi7_mac_op_tx-line-length-v1-1-10e4899b98ef@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260711-ath12k_wifi7_mac_op_tx-line-length-v1-1-10e4899b98ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5NSBTYWx0ZWRfX8smvPLeywII8
 iqbvIQKGgvVKP3b8QFgIbmJyzBUrFCUGRktQEs7Yz6DHFou/790qocyPpq4xHjcYahJndevT75E
 YwPwpMBwHsPrX9k/1eghtMGVp0vHGFFde/Wx7mlR5vM+V/XYC6dM2yVK8jXCUGBpPU88xrxjvhC
 FDLjcbgUYzAX070lU2jkvayf4iLEi0F3/+5C0A/UPvtOOWMDyFDl+IVrmKJD6HEo/vsWpouizaB
 9p95jpnRlRs3MCRqy6NuyUzewPLfYw4SQUu7/GDLvDhlMnPU+Ti3fvorZmEy1yeVKxM7vlg3+2X
 Kk+YZ63DR8rvwQPDsMbIC7mkXeDpn/8d3YWJAMuaiqXmzYCNtQjwRG5Xoubgc2Uh7feBNVJQ31r
 b5rqiJCKfbU4qYowto0ezeYNG+lmuuRrJZQOT8fQXX/wJovLtBWLOJurxxmoNPsBVT4bJ34a+uo
 DDDYeYyDqsSRc10zUYw==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a54ab48 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VPYQ1-KmX3nvB3bNegAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: hF_BvwFZRrwwRYai5gCRX3LY1ZEJUyLx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5NSBTYWx0ZWRfX52ogURLXNnNv
 cfB08GSYAGW40JBNY1fKxuuo/5a5crRIBNNl4Mkw02gHkDabIur2ZMO3FY0UYit2Gqup9UAPbu+
 DjGiyZ1EHDuWSzl0aEsWiNJu3sMnXxU=
X-Proofpoint-ORIG-GUID: hF_BvwFZRrwwRYai5gCRX3LY1ZEJUyLx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_020928_896306_05B9FA32 
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

On 7/11/2026 9:01 PM, Jeff Johnson wrote:
> Commit e47d6c9bb416 ("wifi: ath12k: Advertise multicast Ethernet
> encapsulation offload support") introduced a few style issues.
> 
> ath12k-check reports:
> drivers/net/wireless/ath/ath12k/wifi7/hw.c:1042: line length of 92 exceeds 90 columns
> 
> And automated review did not like one if/else that did not use braces
> for a single statement that also included a block comment.
> 
> Fix these issues.
> 
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

