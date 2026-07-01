Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5993C43458
	for <ath12k@archiver.kernel.org>; Wed,  1 Jul 2026 20:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/sttupdXtbOiw7pCs/wPsIB8AemcBxmj8NduVtxbWo=; b=eJZXHvTrtygbJBdzNLNPPfQN7X
	HqqAsxgCrYM3nH0ZzCmHx+1sXdbbBI1VN5uUknzZMK1KdWCMeVsmRUkEagtS44NkxRJU01vmzdSvx
	S5q0HSp33mzeCB375FL3g4P9a2PiFlt9RdsVSy4uSJM0KGfs22VJEzSiDKs6GzwGGGq9h7J0wimwq
	1nmdMku3czfCe+MwQZr7SzAU69N2mW1sROyrP7d0b6MLkmW/S/pZBhBEiC8bWdFJdo16FuV1bfxol
	CBiYOVAx7Le7JbEidfYRXKc7SDeEn9lrI2YEkq3WfCriYBuGNCd3Xkb3cbhycz0ZW3VHaYw5f6j5x
	qgwtuOQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1q5-00000002zrP-20s5;
	Wed, 01 Jul 2026 20:47:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1q2-00000002zqs-0Yrp
	for ath12k@lists.infradead.org;
	Wed, 01 Jul 2026 20:47:19 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmcGi1711472
	for <ath12k@lists.infradead.org>; Wed, 1 Jul 2026 20:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c/sttupdXtbOiw7pCs/wPsIB8AemcBxmj8NduVtxbWo=; b=aw9X705Qo1L6Ovd/
	eTeVF8FpPTtf3BQE+Q7lP+lp8yz/Yb9mqBTJtzUaJ5WAtjnunqIXASyncLXDhZAb
	uq8fll7/5pE58S3z0+eXMzIEEP3E4mIicZqYWQQIy1HyUW8nIjLmSnsIoDPcscb1
	k356hU2sz/qc7Li5RhKZVCuSPF15BPUColrEIkofStXUrG9wpaWnDpLv+Y3XWvsA
	tT9r4ACcG2yjTTuTNxNnh41IhYMkgDek0kyfLf/c6lAwi1/aC94cVGdNLWSf+JZG
	1nJlzp3fJC3vtDnFFkuystsmp4qlNQMOIOHz4BmSoNUTKNGZ2/cZHA7xZqnk8bb4
	Sz4ytw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5541sjed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 01 Jul 2026 20:47:16 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8620ee0971so1020139a12.0
        for <ath12k@lists.infradead.org>; Wed, 01 Jul 2026 13:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782938836; x=1783543636; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c/sttupdXtbOiw7pCs/wPsIB8AemcBxmj8NduVtxbWo=;
        b=ccSeZj7w3QvIdXal4pY2KKyD/4b7RtyHzfb5iVctnuv8QGxS5PQQHXlQ0fwMwaAoWI
         RFAa9ls6OJylqZci1Gsr6LWhbdU1r3tfyX5UF9ir4L7p1O/H4pIsBR//YgUJE1/CAwUy
         tVFHdfbHkjxIu1vDzOJYakiJKE2Ppg0RPIJgGDH7HfbK/o49hEF2DnBT/705YF4S3UHQ
         mO89skknzho6+ip6lHy0gkHnoIyQn9q9pHsUwoumaehfnPLx8gvoWdkrvx33t2lElTZ1
         6b9o478tZUjaRuUl4dDE5p4GFidtpw0t8Q154eu5sPhFkVJV0ZbM+sc9mO4usFzDRLY7
         zEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782938836; x=1783543636;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/sttupdXtbOiw7pCs/wPsIB8AemcBxmj8NduVtxbWo=;
        b=cVkjJMF5B64zqJHx8G2CRGXgYfF0MXpBZg5eCSFe3iZ2qtjqp+4opjzbLqqM/+A8rz
         Mf81f5ZLO8Xb6vP0rrc7AZggMTX/2mqHkrMBMYM6sh8JW32SEVx81sA9+P1QibuKrDr7
         WSb27WbltfoS/0LJLaYtpK58EXoBikjRTmgO+3rrUQ/ABRq++L+tLgDS5BOVUE+b5W1w
         yceoVKJXVQ3Qhk4cRCT/LWD7812HB/lcKyrozMRca27llKg/B08iDc3YV3FAO3R+HEjm
         RdAiDDS8waRNF6bxBCMltDiq/0oQs3Whszp/TXKKbWZWREOecqYUNjjKy0M91iiqlRL+
         7O/A==
X-Forwarded-Encrypted: i=1; AFNElJ8Huyr8Hykh31liYxqLt99w1NQLb2/UGN8yc1WsmgtxfifCl0lvKhH0SzVqUeVZ/OCjUwEhXUE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxndyiC6QJoa99hkv0NDquwQDzDiJ7aNrvmRGLrVDtRCE4tYw8c
	hi3ozSz6/c/CWCJW/byZ0xMUpgcFC0tST+KUlWKAl9oOK0jX3y7d71v93ye8r6WNunkRlayZ98a
	z/edYrFNvGbt95eI0hR5WNJljmNwYHppO56NOyaGvF/boPn2p+ic3XxQec1SBztkW
X-Gm-Gg: AfdE7cmG+4uUXDFUYQgl05olIwEClI4u8J+bAHfk2m2hhE+HwgqjxmQ6w928j04fhJ4
	GE/IixpTpKomYW+WLCtDpVN9mfPzSA30cAMRzD20zC2kJa2y2u+cz3KYXhDLlrXSV2rxreQovXo
	9FFXT+idFx9FYbKVaBS8uB7pT3vWzgV+oCIQkK76zgR9PJ4Mz/mTWB5SV4ZoQaCzd3mgWUhAT52
	DMwt+OKTam680WsbBx6DSH6hNzFIQQhqwlRpQSDBncQeHJgHqWJM2b7j41Ny7NlwYtWDot48OLD
	pCerYYusYA9jQkc909UR4CKlRe8fSijcNNWw41HaEHO6VegFrZJ3xA01q54xvfm8CZN9JPVJheA
	fHe01l+w+SUVbLL4lt15jW5s4kev21I43R0dFoujqHhh16Ek6dV76KG/q9WSePyXeHCW7
X-Received: by 2002:a05:6a21:516:b0:3b4:c9d5:cd5b with SMTP id adf61e73a8af0-3bfed1bb842mr3860116637.13.1782938836059;
        Wed, 01 Jul 2026 13:47:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:516:b0:3b4:c9d5:cd5b with SMTP id adf61e73a8af0-3bfed1bb842mr3860091637.13.1782938835597;
        Wed, 01 Jul 2026 13:47:15 -0700 (PDT)
Received: from [192.168.1.11] (222.sub-97-215-84.myvzw.com. [97.215.84.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbdc544sm1299199eec.25.2026.07.01.13.47.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 13:47:14 -0700 (PDT)
Message-ID: <152d4362-c45d-4d9d-af5b-d1c8d3d04e96@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:47:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless] wifi: ath12k: avoid flushing scan work under the
 wiphy lock
To: Runyu Xiao <runyu.xiao@seu.edu.cn>, jjohnson@kernel.org
Cc: kvalo@kernel.org, quic_kangyang@quicinc.com,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn,
        stable@vger.kernel.org
References: <20260612032701.1619188-1-runyu.xiao@seu.edu.cn>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260612032701.1619188-1-runyu.xiao@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UJowN-XFFdIXzFi0K6sMm2vyFcfqhb2N
X-Proofpoint-ORIG-GUID: UJowN-XFFdIXzFi0K6sMm2vyFcfqhb2N
X-Authority-Analysis: v=2.4 cv=Xbm5Co55 c=1 sm=1 tr=0 ts=6a457cd5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=i4k25I72rCCN9bAAQd7+Jg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=gSjTWOtbipEii6uOW_0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIyMiBTYWx0ZWRfX9WgkfSSOG8Kz
 4BkOMhvCsG8+T3ki1fdkEpeEEeWAIQYHNtBlHoZEzS7uUUMe7OKCMYAakAOMoXm+wweWzYTZBd1
 vE+HjR/9oQlAqpDoa3e2rtOt8uTr6/1M/y3JJRjLxiSAatVnTNLKjjH+rRI52iTPrhtx6L4swKe
 etI9FpqYw5r5LI6/OLGjiPc/JkC1Pph1AqN7qVR0tgeJfWeCrvqrz+JnLGb1O8LbjXw0kYrskwf
 oxUApjquihmB4GuCmcL6lMhBY4akkGWaD1moswCKTo+Dh3qQNN2r8NXPir9fXavB5AtHaTBIreV
 wyRf+UPg9343Aeez4CiJLCe0ZxADrMMLy4PWNKdmhCmer2uWD/TtYWHDvUrPFPnwsT3s3FU0PKc
 5XjvmK830cLbvMtac6uzlg36kihaYIRwWmVZ1RwEGZaME2AUaTo/lnEMa1BA/4IIvBpahPuSjpD
 +IeJFf+o19GpUidP5lQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIyMiBTYWx0ZWRfX7x52Mvc/Ric9
 tm8la5BKhdzDjpQsxqhbszK3vUuArmfqlzfwWbZBZv2m5d0Vzc4lKYrPdNj8yPNr79Cb8mcOJrr
 trOF+GS2bXzzZSufcZzkdsUWg/NTJII=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_134718_318602_2CBDD5F5 
X-CRM114-Status: GOOD (  13.43  )
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

On 6/11/2026 8:27 PM, Runyu Xiao wrote:
> ath12k_mac_op_stop() is entered with the wiphy mutex already held.  It
> then takes ah->hw_mutex and ath12k_mac_stop() synchronously cancels the
> scan.timeout delayed work.  The timeout worker grabs the same wiphy lock
> before it aborts the scan, so stop can deadlock against the pending
> worker.
> 
> This issue was found by our static analysis tool and then manually
> reviewed against the current tree.
> 
> The grounded PoC kept the ath12k_mac_op_stop() -> ath12k_mac_stop() ->
> cancel_delayed_work_sync(&ar->scan.timeout) path and the
> ath12k_scan_timeout_work() -> wiphy_lock() edge.  Lockdep reported:
> 
>   WARNING: possible circular locking dependency detected
>   ath12k_scan_timeout_work+0x25/0x42 [vuln_msv]
>   __cancel_work_timer
>   *** DEADLOCK ***
> 
> Drain scan.timeout before re-entering the stop path under the wiphy lock
> and leave the rest of ath12k_mac_stop() unchanged.
> 
> Fixes: 2830bc9e784f ("wifi: ath12k: implement remain on channel for P2P mode")
> Cc: stable@vger.kernel.org
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>

This patch does not apply against the current ath.git tree, please rebase.
tag ath-current instead of wireless when you post v2

/jeff

