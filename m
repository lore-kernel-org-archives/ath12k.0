Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA0FC44515
	for <ath12k@archiver.kernel.org>; Thu, 16 Jul 2026 17:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdigXa7u/9/qM5dZQc/0RHIs0kDasDxkAbhkgLWMwW0=; b=lw4pgKItPkSJbAAchwjXKTu+Ua
	DVDb5gSN1WTVz8W6lcnxtTPlGeRiqcks0E0p+gMNiCGdT8EJbDbN4iJYtG2cvVwhDDM426fxpgYSf
	Jd1Yjbq0BYetvgvcpSHjxY0IO+RIPoVWc/UVoi8nEmAXpS2kPdlwoWE5R1ti0r3WUS5BDRqM8+PZe
	LIgBtJUXXLz11CpZjCWadAi07I9XrYI0SFAKPrTI8Vt+173KuMclt+9e73FxFCap+tXPqNZ/TfvLN
	7oMcFw23dyiJFlBy98mgi4HSUUdEZjDXh9Iqwh3m/JpqbbcpTDmroKN3KOuBNPmLib47Nas9a0+6S
	bhu5kluQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPn0-00000000GXZ-23FO;
	Thu, 16 Jul 2026 17:22:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPmx-00000000GX8-2v6m
	for ath12k@lists.infradead.org;
	Thu, 16 Jul 2026 17:22:25 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGTMT93412812
	for <ath12k@lists.infradead.org>; Thu, 16 Jul 2026 17:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HdigXa7u/9/qM5dZQc/0RHIs0kDasDxkAbhkgLWMwW0=; b=Vf99CgNNQ8NRclie
	DDaakprN6lpMS5YhlgXmxX51iDhthdL9f3DHej3t8Q1j7GY8BrEJhzguxmpKX0bL
	QGnwwqb+9W/mcAAk3t4BaBlPQ+JEZRVaKWCyKIozTbauc9QoPtOW64nDReciDmKj
	vjflNL8wjXbRHItrGsfMqFAG1XL3qchJzsXWZmJQyCVMT2f4gIYxXvJp0dGs9LAT
	wQu2jeKOtRk6/rb44UxvLHeaxuOJ6UexqrER7yEw7dfhH/IYswiMHISXzhKg03y0
	DF8C2KiF8GCduodS9c92u45bvFgK871Ix5X+0wdy/C/wpY7UVOHgAg/3522vhbyI
	Rsm4Ww==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feu10ajrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 16 Jul 2026 17:22:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38de842a1a9so6010615a91.3
        for <ath12k@lists.infradead.org>; Thu, 16 Jul 2026 10:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784222542; x=1784827342; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HdigXa7u/9/qM5dZQc/0RHIs0kDasDxkAbhkgLWMwW0=;
        b=QrKqRFv9VppskYYfk89Z1bX0FFCFm0oyFwBu1S4ex1yI/jD1eoozOJywihoTnexb7s
         2THpH9hmylYEDojNyZpI8C2dK+yAD5yXiqPhdE8SVav8kIC9ECa74cVqX4jEYK7dOMtG
         XiggCIO/cgK5Oehb88hc42l36BRkswtkeIBjHmZOZldjK/R6rd1lTwJu/QUEOkudPcoy
         4l0Oud4FgV3A/wBpBPA0gckDMmCYt6ygCo+tNZtjLktVxIq4CSuWXFlBMHc3Da1IOUU6
         ZsXBx7mCUs2sGYSxH5zgY1ygpxB7hzKpQhxZHnRcwYqtrXSmJgAahhn++gmCEwghhrcc
         XQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784222542; x=1784827342;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HdigXa7u/9/qM5dZQc/0RHIs0kDasDxkAbhkgLWMwW0=;
        b=eAeuueLjRXstCH8EbHgu6ZLZBcL97Hw3IF9ZGPEf/h9DV3Di+sSVFkGDCZiYLOZ7I5
         vxBM7GjF0Oa34pZJn7EfyozTQpRH+dFqPih6Wd22uyJ3KVQtbu66MNLPsIrbpZn0p0SN
         1kmY6zw5X2Z+xYpIHsNIjy3JTLYVRZi7KQ46G/fWSnOgF93oBsM7ZJZ2r49AoWZDy4g+
         T/jZ11ymf1GiEw6sezhOQq+mgBp1F6Ux1FmgsZW/cwhC5UUGd1Z+Ck8GQGeQEi+RGzMD
         4vCKGgtsBEJI2+Mw+Sfz+wZbRkFoGyvjFSLuyEyMeWczh7JC+Sfb5b+2SI6OdneTrRMV
         fphg==
X-Forwarded-Encrypted: i=1; AHgh+RrC17Fj2UIvhKiewaL4foAOxfOHxA3uMWYVHMeCV3u1RbR3nOgNsJv5zKQGrI690osP13GvYcU=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr9G1WBooNZ7kg3CMePP4jXBCDLTacy4fhUSt+IG69n2a0S7kE
	4P33llZlH4d0UwoyMGIj4XskhydbRYbSyMqFKNA6FAgzZJXTYXbGsUnmCwiHj//TUzDy9kafYlx
	lezjewJP8CagLaUKZlIuVQLsBcJrjYgFlISI9GMqvtr9M3KYTZW5Mv4UPYS39wlDR
X-Gm-Gg: AfdE7cksjestz3SAcpeckiYLKfpE3tMqmdBrnGz7ZhyHN9/f/p59bn8G74ZsxijEizW
	AGGkVjf7b8HKIaYAhIyPkgc7MgrGSP8O3SjF/rFA9AQ+GFl7YjZpbc9+DlzyB6CfZrEWOLG0PoH
	fNJEcMngN/T6y0R8+Y4bbWfKMJeWCpmQAAWguFvDhleY9FIRnoViOsSWpWgllEYJeiab1d3QjqV
	Zf5i12ZgCvxGkvaknjsE6nI4q7Bds+UxSlHoJrmCcmM9YKsKgsmIiv7reNlOqPECSzQgaIB972h
	1gc/uxIRRyJKt+KF8UaZNuWy7cqntQvC5rokTBsLvndAYg1y9twePoXPhMHTa71KFTeAQxT7GSm
	7slKwv8+LljJoEk03MV4nkg4tAu21VCk0u2T8keXMYuhQ
X-Received: by 2002:a17:90b:2b44:b0:38d:ee84:b1ff with SMTP id 98e67ed59e1d1-38e2a0f1b39mr7511857a91.40.1784222541617;
        Thu, 16 Jul 2026 10:22:21 -0700 (PDT)
X-Received: by 2002:a17:90b:2b44:b0:38d:ee84:b1ff with SMTP id 98e67ed59e1d1-38e2a0f1b39mr7511814a91.40.1784222541049;
        Thu, 16 Jul 2026 10:22:21 -0700 (PDT)
Received: from [192.168.11.102] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6f0dcdsm11848627eec.31.2026.07.16.10.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:22:20 -0700 (PDT)
Message-ID: <4a3a6ebc-67b0-4120-b19b-10208c6cc6d1@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 22:52:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: Constify struct ath12k_dp_arch_ops
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <969d732e2c6f169e1aa5e89c7e01743a1adb55df.1784010931.git.christophe.jaillet@wanadoo.fr>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <969d732e2c6f169e1aa5e89c7e01743a1adb55df.1784010931.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FVqKMke60XnyyUrtWIVkvL1zRoU4cWHK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE3NiBTYWx0ZWRfX+QJv83/nxCYt
 LeaiMkjl5WX6eUm7qjSE4WV4BnUq0imU8KZxX0/d/uiOTv/SOiH+w73jD6iC8j6g3LErapFILgk
 RamsFirfzG5E0aVnmzdBLYh0avuhesgDMh8WE6CNAVHHiomhIG/zsPBs95PgNG6goWL+q/DaAdL
 LlwR608/D7qEkZ4x34KgF0np0+lCENrtwYztJtI74UHKMiDdQVzTp45GK3hU01h/iDLVDVy/7+U
 deVxxMXFd8ZMIsZxqAnEsrYHB2iMe9w2ANACxQv0iApODgaDfzOTHsrsaNFtqeyC0kVY3DpCNtI
 Big9NpTpHBkCUXl5WsW0Tg9oSyEP155w9exU/w5QkgTZXWesF5QrGWZ59AYVjVbSw2p9IV9KWRR
 N2ycm29FJ9V5o/TKiotm58QccorjnPaKTMsBH0onNSp/A9pjSEiwSUOVRZEVSaVNH2YB7KshEYi
 2zOAlmM9iD6Oy0VgTJA==
X-Proofpoint-GUID: FVqKMke60XnyyUrtWIVkvL1zRoU4cWHK
X-Authority-Analysis: v=2.4 cv=BPODalQG c=1 sm=1 tr=0 ts=6a59134e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=riUHQTvyFV0r_oIck2EA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE3NiBTYWx0ZWRfX4PZz6YDfEmdM
 tXycOdsDz4jJrXPDzXISUJcAvKad+RWQqxczhkJ/GyaYHxnjX5aYRqGEWb5O/XQbjArDPAU8m2L
 8axydigg5OOiLkyX5l9AMjjIOtr7/Qo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_102223_879908_A1142B9D 
X-CRM114-Status: GOOD (  10.31  )
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

On 7/14/2026 2:09 PM, Christophe JAILLET wrote:
> 'struct ath12k_dp_arch_ops' is not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>     text	   data	    bss	    dec	    hex	filename
>     6318	   3384	      0	   9702	   25e6	drivers/net/wireless/ath/ath12k/wifi7/dp.o
> 
> After:
> =====
>     text	   data	    bss	    dec	    hex	filename
>     6478	   3224	      0	   9702	   25e6	drivers/net/wireless/ath/ath12k/wifi7/dp.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

