Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C65C79F82
	for <ath12k@archiver.kernel.org>; Wed,  9 Sep 2026 02:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZSDTdETZl73boqQuQK6aw9fkyLRGToqtXSvqysrG4M=; b=w199OwHbfEhErnp0z2M4AMuuey
	72OEy7+/Bdnj3lTeE/WLq+T05iJggQNQdnbhRCANMrn3S9DjZCpOunLnCYeBa1hUPtamglF1H3aJh
	wvPVuNmMQbHeMG/Edimjq+hji+oRGNXspXC+WHbnSfQnaW3fsIyMporH9hlFUdR9CaHzDqOcGAfD8
	JZ/PwE222uAprcTw5MBNgM7E0YkZB2BqvfPQq9N9F24Wr2bDCWZrekmVNSLPdTAVbECJeUsZ3OR/4
	RvZEgQ1F0iprDQJcXqH4xMWF5m+f1soCKu6ORZ/0BWeWCznL7CqE42HG//BZWXSsXLPK2uD8BUj3l
	03fecyfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x47d4-0000000Ae3Y-29ux;
	Wed, 09 Sep 2026 02:01:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x47d1-0000000Ae2n-2pxC
	for ath12k@lists.infradead.org;
	Wed, 09 Sep 2026 02:01:36 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688MgA3g129688
	for <ath12k@lists.infradead.org>; Wed, 9 Sep 2026 02:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HZSDTdETZl73boqQuQK6aw9fkyLRGToqtXSvqysrG4M=; b=MKunbbv4L7NAs9RA
	0EyYZE7lY8VIHHhuXzHTuKCKdWmgxYqkpBov2uKSnbFqg0dsGMfNAv19cdoktYaX
	v+C2FjiSsXb3MrqL6FSjy3VbdW4dblIOKALEHSBp0s4kwe4cRAr9y00lt0Er2Yxs
	xruTuiGZ5MLugdjI/cHKH685eWQG95cLH8MZaE6OFQsvqkbVsPurFIprRANhtWnz
	flE1fXdwF3IsggpEhuWxUe7jH9T+rjA7B3LM2kk55sCLS41bjMxRI59PYK30UyMM
	xjsirEiB8sZJZs6EV4yAj/bNxDJa7qF2nZZcTn1isyqCLfhKhjawOza1oQjTPRjn
	VRw3SQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjntpj5v9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 09 Sep 2026 02:01:33 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84842381150so5862157b3a.3
        for <ath12k@lists.infradead.org>; Tue, 08 Sep 2026 19:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788919293; x=1789524093; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZSDTdETZl73boqQuQK6aw9fkyLRGToqtXSvqysrG4M=;
        b=DGki0UKOQ51vZmArrHpYAU+X7fNpr08YcoxPwfXQhrHdW1lyTUsdKOo7d42cUOTSi/
         sb7aYsM1A3fudJ+fipp26VCRy0XTHZxIG+iNXAHU74C1neCYUN7W5nvYV5x/G4AA6GC2
         lStWJfiq5wtJdzMaRLxRLDYPQ2yu/QmckfRPEMSjGzYhpEFOxgjJAIoJBsJ6JU3gQwcJ
         xL7UmxLJDDb24g3fOy/iubiNH2zkT2mTk3HSry6swCC1eKJad+eoZTxRdRyRU1BjU87d
         m1WW6FSXUZhTEVYFzUm0toZ0gh4DuaV/Zd28dvCO0HGRcU407TK6OmTBx5RhXiF8kp2o
         t64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788919293; x=1789524093;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZSDTdETZl73boqQuQK6aw9fkyLRGToqtXSvqysrG4M=;
        b=MFNcsTpgvnRA4wEb8U/8018CsH8utJsOpQCnJeAsQKUXSAW5zcq9JupiVjj+KLFJYx
         3WaBdTrMS89s8WCSj78yWrh1Qttit20+RA/tKJzbKQ4vEzcu6/e12Q6/ac3gxlPvq2NQ
         k5LC/1x46G6hgIXDv/U+RHDgk9ZSPpizs0J5SwAJCZlfJTlevP5NvhiG8x2St5sk0JBr
         dF0xqjbSK0B5u/MmdKjPV/p19GFypK3NZffpl5v9I+As78fB8O4ZpeL9HuheN3+os8il
         oBYkQDToP7OZn9ZzfMr0s4hMtfDrYDieH94EsXkNhDYdVq5ZzlnXe/eL1/SQmFyoq7GC
         eZUw==
X-Gm-Message-State: AFuF++nz/x3l1M4p3nYXSmZA52fVLwQeKb7rLmCX3n/gAgVzBBDStUuD
	mlwBa9KLUuHx/pNM9w1J3DsBL4GMYOY1eKdjlWs9awayXq6d5JseTnzKO+Ffs0HcHbImVhhiT+c
	0wAZkuUGFO2nozBOEJeSHVClNBAvLUin+1DLhHyVQ6ujUky+UEIaCVCf2LSX4mNRF
X-Gm-Gg: AYBFou3HyGFmj1Kvv8N11QzcMK4t2EaeXK4Tbcxto4TWVzr4LoXw9BVoAte4/wqqcAd
	Z57J35sQTXv/rckqEvgQMLB67nWeB9+E3awHuEscdlxaPMkb87OFThJsrK6uQ73nGEIjLBCwOYa
	L4PV6bwHCCGLfl87cdvzQYAOGoESKQiVv9ZQPOzqeFfgyo2zrUZzu38cjPORrk4gGeoQdueSoDH
	1a7BXepCezXvG50LcniEOd/YDxqFxQHkYQ/aoKGD8vDWtCu+IF6x7Rw5QARVsV/1FUpIPcF9qJF
	aHY6n7Po3sVbcjYiF4VIGma43T9cCg8Bf89zObrLA9RtR4xZIEZxHCHTFxghzTskec9ttFGBiWr
	lahix2gPEkeB+4xHYrsgOSLhcSTPZjkVdOzbN2ii3GSqZdDRQcCVAC0A=
X-Received: by 2002:a05:6a00:302a:b0:848:67ca:bfd with SMTP id d2e1a72fcca58-86168596eecmr53684053b3a.16.1788919292355;
        Tue, 08 Sep 2026 19:01:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:302a:b0:848:67ca:bfd with SMTP id d2e1a72fcca58-86168596eecmr53683964b3a.16.1788919291597;
        Tue, 08 Sep 2026 19:01:31 -0700 (PDT)
Received: from [10.133.33.250] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152e2f1e0sm6181927b3a.36.2026.09.08.19.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 19:01:31 -0700 (PDT)
Message-ID: <e2701af9-a9ec-4851-9f78-a1bb6568f050@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 10:01:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: preserve PPDU state across monitor
 status buffers
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20260828065534.1537-1-kang.yang@oss.qualcomm.com>
 <CABkEBKYdFcUfMGj1pGmVYrdLQTO0eExq8Z+vMdjYGN+yjQ2uFg@mail.gmail.com>
 <e7a1a2da-bcd9-4510-8c26-c049064d68eb@oss.qualcomm.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <e7a1a2da-bcd9-4510-8c26-c049064d68eb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDAyMSBTYWx0ZWRfXxSJlR4Knj6xJ
 bKLbbHveAYzN8tx5Jx7utI43FxJIdBp5ZuYtDbMGt3MwjGEuT4L24RVtPKm7+0diuMLptYv7rLe
 R4mcvkOiGsZy5f1Y0hmzkUs0pwucMXPUkPFKlr1asYFel9pe8L7tOjnqWplvHCmkXM7NKPsU4Nt
 heIDfi5D1esVBywN88sTMOfF6ls9RrV5ntPHHGpZbaX3op31+ps/9OLTJNzYnSNCFAAGGIV9cSG
 MRbocz3ocp1D/9tHOwaaTAdOhANLXbgjUbxlE/PAUwjjXheuladT1RpOhdz4tYBDfs3LciEKnfw
 Hi1CSwE4OcrIM6hk3Yy5T0rv3Lj52N9GaIz5caqsMhGf2YRyqdTsRc2JgdTEj/avDz1ZbG7U+rg
 v0sQib1BPeMj8DL3ecSODa1rdwzPnio7NuvAxz97B1RlWXP8W7c0VnHYTxhZ+L24kzJx1VEHQiq
 xxxSZ0PlsowRjFx7w3w==
X-Authority-Analysis: v=2.4 cv=N+AZ0W9B c=1 sm=1 tr=0 ts=6aa0bdfd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=CwnV7Y8CetrsFUvn-6YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: nwCA81kPxCuQKuFoyDWIS7pN0SvW_4Nd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDAyMSBTYWx0ZWRfX3e9M//4zb4v+
 U3U6UE4zuKOsfZk5PVENz01vi0AsvqHkFih1ZjYKt/9elJGMHUsLjBVypwhJ2bb7IAcKgSfall3
 JFk9Ucawec1DXYbacvCaoy6j1tKqPno=
X-Proofpoint-GUID: nwCA81kPxCuQKuFoyDWIS7pN0SvW_4Nd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_190135_828864_9A879E99 
X-CRM114-Status: GOOD (  12.15  )
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



On 9/9/2026 6:07 AM, Jeff Johnson wrote:
> On 8/30/2026 10:53 PM, Tamizh Raja wrote:
>> On Fri, Aug 28, 2026 at 12:26 PM Kang Yang <kang.yang@oss.qualcomm.com> wrote:
>>> -               if (ar->monitor_started &&
>>> -                   pmon->mon_ppdu_status == DP_PPDU_STATUS_START &&
>>> -                   hal_status == HAL_TLV_STATUS_PPDU_DONE) {
>>> -                       rx_mon_stats->status_ppdu_done++;
>>> -                       pmon->mon_ppdu_status = DP_PPDU_STATUS_DONE;
>>> -                       ath12k_wifi7_dp_rx_mon_dest_process(ar, mac_id, *budget, napi);
>>> -                       pmon->mon_ppdu_status = DP_PPDU_STATUS_START;
>>> +               if (hal_status == HAL_TLV_STATUS_PPDU_DONE) {
>> Consider HAL_RX_MON_STATUS_PPDU_DONE instead of
>> HAL_TLV_STATUS_PPDU_DONE to match the declared return type of
>> ath12k_wifi7_dp_mon_parse_rx_dest().
>> This is a preexisting inconsistency, but it is good to clean it up
> 
> Let's clean this up with a separate patch


Yeah, will raise a new patch for this.


