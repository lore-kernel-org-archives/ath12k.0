Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFA1CC6B2F
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 04:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//bSM8GNDIgw95mfea94ToRsP0KjlF89G5EyU94bTuc=; b=cxk5WlymEgFgy+n+G+mdhWjcdG
	9Sg53smyj6QUe8rT22nG/1I7oI0DN70pmslcwr3KxtuCNe+DKpC6p99D1b7eIUqQiYBlXtZwgug1+
	7gIBKf/LwzXkPFtWGgHxq0jLLzn7NhZWDYSl8kknH+7yjaLRx54oUHHj8mZHPfnMOqVnhLxw4N70+
	JCJqGHTWcpRS2wxAep72jIuxl005rrrUg9NDaTq+DJARaBWEW9WJjp84Os+gDMMKfSrhmKn/0nF7s
	yMPfMo9z16GbWGxEOhN61ouyiuhnMxvQEfZRgWGlb/t5KGDWqZQKaISk5ARomILiU3vS3BNwweMuJ
	HhBtWIiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCn0-0000000Gmrc-09gX;
	Thu, 15 Oct 2026 04:09:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCmt-0000000Gmr8-2eZw
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 04:09:54 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F0RHrj1684736
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 04:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	//bSM8GNDIgw95mfea94ToRsP0KjlF89G5EyU94bTuc=; b=QadazxxlAJGoXnl4
	efWZaS3QXF0Htj4qMIxKPB3TbigmiPrJBJF48AxRe1Aq7gta5rfkvNSAZOyQ7Rt+
	Eff6eWfbXKtBkC+S3Hw7fCH3Lv5ptQcV6k6+Dz88TRD1Ivq9nwSrTLJe0U6C7v64
	UjNLCMltABxPrZuv0rh4padmYQRWIC7iYw/mneNmWvVg3YkAypSuxWJ8SmzWMjON
	j13b2BizHNfBi5vE7Z4BcarYDuZA8kVzoUr1TfJFc3zEEu2wLBS7a+Pmq9CpFTY0
	g6bRM9CPd3hckbruJhUcYzDz7+ZUqM8yUuN4ey/pEwkEFcAcf98jdX4q8S+bwDIM
	gJE45g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacb02j3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 04:09:49 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso3047977a12.3
        for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 21:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792037389; x=1792642189; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=//bSM8GNDIgw95mfea94ToRsP0KjlF89G5EyU94bTuc=;
        b=cCbSeF5MdrsxT2+AjwEmdEGsjf1wMfGwlX56t5CdJ+j5GhpUKQI590JSpdlS3fj63D
         hh7yNQNWm+lGnh+PsS35qNZ9b1LZYAABwQsIf/wdmWreQ6y4em3B5oVgtyrZe1vGF1Ze
         JG2sJnf0+dfcr2rhRe41BLSUS9/8NjV97t0W8dPo+uVm9oJg0jrQaJz8c45B76NgWouu
         PkOjEOysa5Kw2DPcKInJ0sfruwj38qXnZVoC6Ibgh1xyXUTrzGmrOwwjJyVua9QJAWsn
         f//YfFXjsd8AyV53hlW4mYGli7B0S0p6ajNPUktWwNjqU9yfNGgUSn5Oj5uX/lOMIM8b
         7zyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792037389; x=1792642189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//bSM8GNDIgw95mfea94ToRsP0KjlF89G5EyU94bTuc=;
        b=a1AhW97DH5v9kDR9QdYVE6gslTj8lxM7T5OgCnYVoniiiN4RUN4GqvDoltGr5DYeAL
         WPUP2zsqfzOO7PECHhCSViyhxY2IPJTaXoHMATPC/z95NzczrjIjGCuYUyMPjMxZVgUv
         oBquorYkMQEazRcM9Tab1xU9hWPEGT8dG9OrEWOOPwISO2Fp0vvNMqlIbMqrYY5guuoF
         QZaOREcgqzQ2Pn77kZN7+I7Z8Fx242rfwQyp7qxmV22vDXHM0oG2HVe2jluCDdJiWztZ
         02q+A3/mRKfO+m3odSsl82zYl/0jkWzjSLLBybTbv9Qic1ZRo9/3ObwpTjWcBrDGzUfJ
         OgXA==
X-Gm-Message-State: AFq9FYL3L27aRodGV6KYi0+soYjWbYVvkzcQHBDneWhwjSIPuP7tNajO
	zp6LQyZzoas4C1wbA3MK1lxYGDSdwjGabkklHA7B+jN5x5kbdJYjeCXeqMyzbZGrff5VGuuHA8y
	O7gr9sOPIK2bKbHPdI/A7fj/8vN8kVJH6dc5ZVFXIck7ckCivYxUmp2MEhlP55xdHBLW0dv5f
X-Gm-Gg: AYBFou05XxgQSSF7CQ2kYnEPbyuyBSQSiF7qqhFwmtNHEpaSh8RK9jL9+H9mbyN0WO7
	m7jXtdLRGQud6Ur0aIdRhZLMgQrv1gZrQkmhYXsgIK9bkCpAoVol5VMgiS1ei7DECK9Rgcp+5f2
	zXYTTX/6P4EsF/FgzC/TNgfMEEi2M7I+UkKuQQoghhiSd4dnttTUqqrtLurgP74f+VDgjU1qy+H
	w1TivEkBqXFgC/fo0cCFKDSDEAo2YWVCA8LldW3vMgBedvFMvpGOwBLL7Y3/xflIwhITNJWk/Sn
	JlJvatJo9OrXXBjZaAA7HmmSsPzKFSQpbec9xZohg2lwWX+jKa6pHnr3MCBTibaYbJIwZD+TobH
	GZo6UY5DKNKG/xJJg+tJUzlnnNSTvb37SFzJE9+V07Kuyxm68AX0cdqL4br2Hjy7ADEkdbA==
X-Received: by 2002:a05:6a20:258a:b0:3e1:2632:ead1 with SMTP id adf61e73a8af0-3e16be9393fmr17478081637.43.1792037388886;
        Wed, 14 Oct 2026 21:09:48 -0700 (PDT)
X-Received: by 2002:a05:6a20:258a:b0:3e1:2632:ead1 with SMTP id adf61e73a8af0-3e16be9393fmr17478064637.43.1792037388427;
        Wed, 14 Oct 2026 21:09:48 -0700 (PDT)
Received: from [10.133.33.10] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd635cdffa5sm583593a12.29.2026.10.14.21.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 21:09:48 -0700 (PDT)
Message-ID: <0e12ba1e-82cd-44ca-84e7-f63aff4b5934@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:09:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: Fix failure to create
 ath12k_dp_peer on MLO reconnect
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260915080053.918500-1-miaoqing.pan@oss.qualcomm.com>
 <d44a7d63-2540-4886-a709-9fd75cbd4c0b@oss.qualcomm.com>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <d44a7d63-2540-4886-a709-9fd75cbd4c0b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VKpIDNPX c=1 sm=1 tr=0 ts=6ad0520d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ogbkhcyfs7hGS7LeRn0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxNiBTYWx0ZWRfX7PvRLZTr87bl
 5MAtBP0SFQsIrOnWdl8VK2BtKy2V4RwsDXayE8ahlxjVr6wggneoaX/Dffqc8U/LDcDqtHCq7mL
 p2XyNuN7ovnM/QBCVZvQAj3OUwS9rHA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxNiBTYWx0ZWRfXyyuqB0og0fpA
 kD96pj5Tn6qjCVXcF4ZVHxvbavRxfLVGJHtEIZ7G9izcHuC0BGZNDNYXBaij3KX60qQ9oBGA+Sh
 EwQMmJRpIcfDziIT0i1c4e59HyIjW6V/83vSvVghL2+oN/kja22sU4gixXi0Qfi+ONFi62cbf2g
 ZA5dEYOXYNb0MZvLKzV9Qxz3uRqO3+csYyjBuJAYmo9Wog/q5eUSFuYhQ3wDDVrwsDoqMYZ7YGd
 6i/ZBMNz5xF02FNYnr2oX3wRgdco11xM56k2LF9RtVXrwrCa47JvITnhXR+kxPoIQdkeBCRskiy
 gjCncWUEPWHN3h/SsR56JGRagldRVsFmxuqGCH1Qgh7bKAQVxu15lmoZYLQgNO/ty3dJ1l6Cdht
 +lBcLkXmyGR2ykHfGAQLV3TtbAzQJO1P+F4jYuvrf/HtAgupMfVcWW2lxlsLZvHyXOlK1WgQJnH
 hCBUol05NlCU3aShiQA==
X-Proofpoint-ORIG-GUID: c-c4kof7uct9VcRc9J0IJEpQnmuLY7xJ
X-Proofpoint-GUID: c-c4kof7uct9VcRc9J0IJEpQnmuLY7xJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_210951_708532_E448CAD6 
X-CRM114-Status: GOOD (  15.59  )
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



On 9/29/2026 9:42 PM, Jeff Johnson wrote:
> On 9/15/2026 1:00 AM, Miaoqing Pan wrote:
>> In ath12k_mac_op_sta_state(), when transitioning an MLO station from
>> IEEE80211_STA_NOTEXIST to IEEE80211_STA_NONE, after ath12k_dp_peer_create()
>> succeeds, on is_sta_assoc_link verification failure, it takes the
>> 'goto exit' path instead of 'goto peer_delete', leaving a stale dp_peer on
>> the dp_peers_list.
>>
>> On the next connection attempt, ath12k_dp_peer_create() finds the stale
>> entry and returns -EEXIST (-17):
>>
>>      wlP4p1s0: failed to insert STA entry for the AP (error -17)
>>
>> Fix it by changing 'goto exit' to 'goto free_unassign_link'.
>>
>> Also, there is another error path in ath12k_mac_op_sta_state() that
>> jumps to peer_delete after ath12k_mac_assign_link_sta() succeeds, without
>> undoing the assignment through ath12k_mac_free_unassign_link_sta().
>> As a result, the link RCU pointer remains assigned and a stale bit is
>> left in ahsta->links_map, which can trigger the same -EEXIST failure
>> on subsequent reconnect attempts. Fix this by redirecting that error
>> path to free_unassign_link instead.
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
>>
>> Fixes: 0cd46d1f36ce ("wifi: ath12k: identify assoc link vif in station mode")
>> Fixes: ee16dcf573d5 ("wifi: ath12k: Define ath12k_dp_peer structure & APIs for create & delete")
>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>> ---
> 
> Baochen has a more holistic approach to this problem in the works, so dropping
> this patch.
> 
> /jeff
> 

I believe the patch that needs to be dropped is this one: 
https://lore.kernel.org/linux-wireless/20260815014329.3748059-1-miaoqing.pan@oss.qualcomm.com/.

However, the patch itself is still required. @Baochen, could you please 
help confirm?

