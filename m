Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288C4C43458
	for <ath12k@archiver.kernel.org>; Mon,  6 Jul 2026 01:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GHdfImx1yTltlv7sKfVOJsO/J23lJUnb8b4imCz9Wy8=; b=3C7oo4b6JbiLzpv4RsgcQFsn7Y
	A8ZoEXbV21ALzxZXhd7ohrabIn4qthhn8Tak8ct3xnuls0pXiuYXUrO7wMACxJWuD9Z8Xgz8ak0vh
	XJYBsFNwZo5+OSay4byEbG+KFGyvwj4vgk6zpgA0ryEsHxjxwOxW6QzejrcIshNrnTBL7CQBbtj3h
	NfeOyzY1y2Vpva93AUGIJ/1bkL03oySGuk9BkwaiXsY40lxgMuVkvnSRLt62PQfzQjAwjQGnQ53mz
	JACJVvY5k1QBmYW3KngirnOoYR2vXhxYHpLSbDzWQQ5ONTCGuRo9wDx6SArNQVPjKQ5O7EHy+iyO4
	DnaV9Etg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYCj-0000000BE5v-3gI7;
	Mon, 06 Jul 2026 01:33:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYCh-0000000BE41-1vir
	for ath12k@lists.infradead.org;
	Mon, 06 Jul 2026 01:33:00 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665LxTg02684012
	for <ath12k@lists.infradead.org>; Mon, 6 Jul 2026 01:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GHdfImx1yTltlv7sKfVOJsO/J23lJUnb8b4imCz9Wy8=; b=ddyRh7dRycdLq5GY
	TuSTkI1GMFedej8uY3HiYBNBdjOPVDFoZ1JeLeHJ05yGfNP/mzC51QCgSkWXLaAY
	kLFfgFZ/a8Xk6Nd7LIzSkJV+opil9mW0alUI6h73WYrpaveBxl4p7XFaxy/6wyh7
	3OiPA+TVc/8qKmy2PdEuTrDKMY165Q+m9tP1cLuVIVcb0FbsoVOCdt0f2Z9wzkOS
	5vQapML1qZMj1EL5B1cP/U6LDFZ04unYKypXkFTyfgHXR3lJNBJMxhRKm97K587f
	ekYxsKFCU5Tq8OEjFWbOnjlr0zUxY1FCEvG5i7IQLu864oPWid5W8kRHQDQW+T5P
	m1zasA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6tj8ku8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 06 Jul 2026 01:32:58 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8479586724eso1926527b3a.2
        for <ath12k@lists.infradead.org>; Sun, 05 Jul 2026 18:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783301577; x=1783906377; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GHdfImx1yTltlv7sKfVOJsO/J23lJUnb8b4imCz9Wy8=;
        b=QNyqN0XafrLmHNnsxgkZr8qwUkIfrmoJMrhJoxAsW6C1k+XiRCZozGNd3Pu3JIOoGB
         M/NOC6G44ghj7Nt7z/hSadZhUly0KsF+W0C7APxtGyc1RMnW5JLq6Y53CPkLIU0p5jkZ
         S8FoFAqok7uPVw/fPjBbsuRyGkp5bOS5bpw9I0obz1fAr6NE1tRtToR8g/h+4nYx9i2O
         2qZkJYJG3+RuiXs8t5yz5865S3mtS6vlRWysUcY4qdRDygYRWvsn3yPliEwPQhIUcIPj
         xxyvprY/P2VDOmsryJdAoKovdZcQm85NAeiNKorL6RkpD/JJPgqCZ1TXJNFHNhPJJnES
         iQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783301577; x=1783906377;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GHdfImx1yTltlv7sKfVOJsO/J23lJUnb8b4imCz9Wy8=;
        b=cVrpobG265DcZUAlwk9o1/6w98rwEgDzTfILBJQ0y4PVwpxG9SaGC9WNUyASCJ93Mn
         u/HIYwlKaI8boIhGDE5HaAxhuQN3Yugk8pDgdt0o055WSKIRwt5gLJyG6asbB/jz4bja
         +R9ngml73/wg0QxvdlcnwNalayTZB0mlDCShBie6A5PVf2DlkTLUVfV+5naePvKLFCnt
         YN/hkBH5cC4WqznxJG0Bbi7Mrd1GgWxYxkhGAZT7SnUy/tLSZeK8KcIp9KvUkZGi18Mm
         0gIXJYPAr0qe3Sm2dFg3IZthOHlz6+BGc9sg6O0n+cSJIAf6QxFgosvfGLSy0WWeKBtp
         gVEA==
X-Gm-Message-State: AOJu0YxSvJZPp2k8uENuJj/sGmGbA4ftOw9b0rk+ArbwdJp4fWiy9mOO
	MC2wKzFlNlRW6qNV19Axr8RXQIQm1Hq0SFlIRpZk5zNyEFdAQBYUIwnZrg4ULKxtiO2AEoF/418
	b2LC7lSDgU1+czWZQPpYsephmrBhTHU4zORt/2e7NN2ZCice0KdsJkWVC1WXjxGAt
X-Gm-Gg: AfdE7ckD1vxSMiYXR3qjhRTVmxy4a9uRGuVk7i2ux4hW6Ac/5Qa/KiTuL/cYXT2zpYO
	XgUDqfJu7fLBHVCfCRAmm5diUcjRZbWu2ckpsqAFiCtYANi0ZPsCjpfO5Ls3EPBawJQK1bFf1zg
	RvR7H39OFsn/yMf7ch+pcZMex6jPdD6dMoLW8sbDxLTwT9y3OwSIvRzDoh+Dupdx2yEfsRIQaJM
	00wJENixuc5ScOwqIlL/1u/Ka9nVETINxwG5L/h7kIqTMwp7jy7MuJfYILXZpxqQUtO7BzDS4gn
	YUe5Ni5Ez30DWOk1doB2OxirLbuuuZ+KcDzjD0e+QcJXhAkBfq1ZQD7wNLFFs/Q0xYCBdtVUkaz
	MmrBtVk2wrVS6XSNWRFhDTAmIchjlJmY5XG1Fys/FA+j7UNbJAJvS6Jxtt18+cQUg1IK/ONBk8g
	6FrMVmufa/
X-Received: by 2002:a05:6a00:1303:b0:845:d4f0:98c6 with SMTP id d2e1a72fcca58-847f6d66480mr6893005b3a.4.1783301573840;
        Sun, 05 Jul 2026 18:32:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:1303:b0:845:d4f0:98c6 with SMTP id d2e1a72fcca58-847f6d66480mr6892983b3a.4.1783301573124;
        Sun, 05 Jul 2026 18:32:53 -0700 (PDT)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b6057dsm2916220b3a.7.2026.07.05.18.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 18:32:52 -0700 (PDT)
Message-ID: <0ade08f0-05cf-4c30-ae81-3748fe6ffaf6@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 09:32:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: fix ML-STA authentication timeout
 on QCC2072
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260704073000.3300099-1-miaoqing.pan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260704073000.3300099-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDAxMyBTYWx0ZWRfX8igVecV58uQS
 CDkZ9cIbykVpwyrPAEwy3CIRShkFacnihGOMs7k+SvRqGv9EO6zwNI7a9OOAjyxzN7B9jL98ZoA
 HqYmFmp04UZLfOk5LyHDS6Nq/7pehjw7z4UUBVAzKk2KzYDvEFqJV3mBqdUyJ0bUCIuwvSl7zBm
 m0k//Lt2iSk6dzILVMQUO4WhynYnKo6OmwioY7fLjZ94JADR6Le72kY7ZtB5p8dueSh8FCfhu7w
 lEO8nK9Ul0JkOML8Qp2DNs5gAg5avTfasfXSFn5wx9O5PfiIvD91BiumFpgCYiYQxzHHowG+2IO
 a/R1Mb4BFvrEWpTPAHOp1K5FoHS2jGzTm+8t3NokbRekAoZ3HSIb2SVwye76GM8TkwMd7gsZZp7
 fWYicaLJQu6yHIj9aCWJXGzeEjVQ5lpvf4XfzQ9ZHKh4B/HMfQQIxiqe/UOdksYi0IUdfWkiGiS
 PCNH4Rfw03xPi/ncFPw==
X-Proofpoint-ORIG-GUID: QaCLJ-eMHjIH16kcYBIa282u3_O4JGMB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDAxMyBTYWx0ZWRfX4BYKjigNOX6a
 W9t3sRh6gTI5abfp/i29J7zTrnCAQpT3YdxhhHiJZCXeCDMWyB5dc7AdOHz7eB2qa8dgFoc4+xC
 5+/IaVknI/rAJs7S2/zy8iNAJcAX6Gs=
X-Proofpoint-GUID: QaCLJ-eMHjIH16kcYBIa282u3_O4JGMB
X-Authority-Analysis: v=2.4 cv=H6TrBeYi c=1 sm=1 tr=0 ts=6a4b05ca cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=J60ckWpfDA7ZE0iGEaUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_183259_618177_D5C76619 
X-CRM114-Status: GOOD (  15.40  )
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



On 7/4/2026 3:30 PM, Miaoqing Pan wrote:
> QCC2072 firmware interprets the MLO_LINK_ADD and MLO_START_AS_ACTIVE
> flags to control the link state during MLO vdev start. MLO_LINK_ADD
> indicates that a link is being added, while MLO_START_AS_ACTIVE specifies
> that the link should become active during the start.
> 
> When an association link is added without setting MLO_START_AS_ACTIVE,
> the firmware may transition the link into a suspended state. In this
> case, authentication frames transmitted by the host can be dropped,
> leading to repeated authentication retries and eventual timeout,
> for example:
>   wlp1s0: send auth to <AP> (try 1/3)
>   wlp1s0: send auth to <AP> (try 2/3)
>   wlp1s0: send auth to <AP> (try 3/3)
>   wlp1s0: authentication with <AP> timed out
> 
> Avoid triggering this behavior by setting the MLO_START_AS_ACTIVE flag
> when MLO_ASSOC_LINK is set, which tells the firmware that the current
> vdev must not enter suspend mode
> 
> Note that this change relies on firmware behavior observed on the QCC2072
> platform. The firmware on WCN7850 and QCN9274 does not use the
> MLO_START_AS_ACTIVE flag, so this change is effectively a no-op on those
> platforms
> 
> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Fixes: d8e1f4a19310 ("wifi: ath12k: enable QCC2072 support")
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

