Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13782C54E49
	for <ath12k@archiver.kernel.org>; Thu,  7 Mar 2024 09:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIomtRaUEzhjsVAIwJkR52Eyfs5z54AAhKI/aKDbYY0=; b=urTQ9FLjy3RO/e5Qu32uzw40yW
	/6knSbuqUCtmKf80k/jabA2iuuy5b0FVPlB0AJlXldfSWbI2vBrQZZxU3VnVx8cxzvezqiAp1b40+
	br9vl7eGvP8y0zHdqua7INwIcJho0exqJ6lU4grf2UaHKDdzXL94iCO14R1/M0YPixCh31F54+4LV
	mtjRVXoVnScmMArtQjWCfUV+iDSlc9vDDIo+96IjqWK57glxTT+8UbSwBvglzLAbCUkSlfmc726F/
	i51qMYKxWU5QP4NehPs6C7BJkLe8XxR8LDGGwffZL+EVpgCaXp0vDiTLZYBPHwmeupGfsuN3c80x4
	ln1J2QpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riALe-00000003vOc-3BZT
	for ath12k@archiver.kernel.org;
	Thu, 07 Mar 2024 09:47:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riALc-00000003vMb-1uBw
	for ath12k@lists.infradead.org;
	Thu, 07 Mar 2024 09:47:34 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4277ndrm005292;
	Thu, 7 Mar 2024 09:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=FIomtRaUEzhjsVAIwJkR52Eyfs5z54AAhKI/aKDbYY0=; b=Xy
	zFi1A54mtwp/Ps9OoV2JTadrC/JteOs5wMRJip8JbJmg0Tft0Q0D+6JbBsYXt1Ae
	gtaMZZhNjjIMw+YIgvbu30P7LBsbnAjDxAM8ActnNPUXeaE7nHcDjNFwhoEy2XEy
	Cn1XByStqL5lGUQvMRYzj2yZkZxcruiaNZTAXCaohzT8nSM/n72UUFeTJVBt/lE0
	kU3IP77y7Tgym5iRibUBwCAOVwLTkpWlmHKiarhC38BGe7NI0JfwXFJSA/LnCWo3
	BIm0eZZop/iglFeyO5rDffl8FVlhDMjpeOFtnK82FA2bCEYQMifAna6U7q9iHD9+
	qzSmofP8ZFm0V2fDRVHw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wq9h8g71t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 09:47:22 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4279kq5w025326
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Mar 2024 09:46:52 GMT
Received: from [10.253.39.187] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 7 Mar
 2024 01:46:48 -0800
Message-ID: <4536614a-7f4c-420f-b042-f71cf46ba08d@quicinc.com>
Date: Thu, 7 Mar 2024 17:46:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/11] wifi: ath12k: allow specific mgmt frame tx while
 vdev is not up
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240130040303.370590-1-quic_kangyang@quicinc.com>
 <20240130040303.370590-9-quic_kangyang@quicinc.com>
 <87il31r26k.fsf@kernel.org>
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <87il31r26k.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IP3sIwhvg9s76rhdY2S_-3ps28NLUsLz
X-Proofpoint-ORIG-GUID: IP3sIwhvg9s76rhdY2S_-3ps28NLUsLz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-07_06,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 spamscore=0 clxscore=1015 malwarescore=0 mlxscore=0 adultscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2403070071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_014732_551777_EFC2ADF7 
X-CRM114-Status: GOOD (  15.79  )
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



On 2/7/2024 12:24 AM, Kalle Valo wrote:
> Kang Yang <quic_kangyang@quicinc.com> writes:
> 
>> In current code, the management frames must be sent after vdev is started.
>> But for P2P device, vdev won't start until P2P negotiation is done. So
>> this logic doesn't make sense for P2P device.
>>
>> Also use ar->conf_mutex to synchronize ar to avoid potential conflicts.
> 
> Please do locking changes in a separate followup patch, I removed this
> in the pending branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=d357dcb3cd0cd3bf57064dc673b5477d884454b3
> 
> I assume you are referring to ar->allocated_vdev_map and access to that
> indeed doesn't look consistent. Most of the places take conf->mutex but
> I see some places which it's accessed without the mutex, for example
> ath12k_mac_get_arvif_by_vdev_id() and ath12k_mac_get_ar_by_vdev_id().
> 


Hi, kalle:

I just take a look for ath12k_mac_get_arvif_by_vdev_id() and 
ath12k_mac_get_ar_by_vdev_id.

Both of them use rcu_read_lock(), so we don't need mutex_lock() anymore, 
right?

I also tried to add mutex_lock() for them, cannot work well:
[ 7804.291286] BUG: sleeping function called from invalid context at 
kernel/locking/mutex.c:585
[ 7804.291349] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 0, 
name: swapper/8
[ 7804.291358] preempt_count: 101, expected: 0
[ 7804.291366] RCU nest depth: 1, expected: 0
[ 7804.291374] 1 lock held by swapper/8/0:
……


> I recommend in the followup patch checking all the access to
> ar->allocated_vdev_map, fixing that if needed and adding documentation
> to struct ath12k::allocated_vdev_map how it's supposed to be protected.
> 


So i think the initial change is sufficient: just use mutex_lock() in
ath12k_mgmt_over_wmi_tx_work().


