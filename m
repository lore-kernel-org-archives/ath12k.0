Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF68EC4828F
	for <ath12k@archiver.kernel.org>; Wed,  7 Feb 2024 04:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QuLmviIynL5TQakGKuF5+ilM7aQ1ryEzr6yeSq00UIg=; b=VeTyNSGl0eUHWhV1qeXDFP/HtE
	TK3FhiZON1VLDpuM6UVFqQJgAN8YZR1t5xfiDl8Ubc5OF3l9mBZmCErGmJXaxdK4EP/BNBmO0NGO/
	0cw0rRy4oqOATcZjrtFNItvrS7dZOX+qztd+CzOIsJWSZjN6lZGXg1KZ/ViHy+uvW3uedIdn7KjJk
	TvtC8SLZVRzRzlNKhBEUFUxGS3WVZ/N5DFyncfbR00PnGmAUUfPNprA9YAIQ5nLA4Azldp/zWo7QR
	D4JGz9tyREFGXQURsNZ8enY/rSEw0C3vMe4HoR5wx2joiEryAmWsS4WnV2Fe79ELe9Ml0xVmLIRkF
	Ui+63FaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXZnz-00000009gOq-1Tx4
	for ath12k@archiver.kernel.org;
	Wed, 07 Feb 2024 04:45:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXZnv-00000009gO8-1rX5
	for ath12k@lists.infradead.org;
	Wed, 07 Feb 2024 04:45:01 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4173wSgR004838;
	Wed, 7 Feb 2024 04:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=QuLmviIynL5TQakGKuF5+ilM7aQ1ryEzr6yeSq00UIg=; b=VE
	F2Nw1fIplPD3Qk3OEmYKPqnOItUarLYHI+a7Oc00ZToyfGbbsQNT0Yr+cRs1oQ5Q
	XOxaksyYqJZaXaxqUWRIS5Ju51OKmBVZp2Rj2yFzOhY7NnkR477gqtqLlIxLoho0
	B/Obt1CCUqQSI3xP7aZOfYDuOW24aKUA66Xi2kgfD9No/ri05p7/RJXSsWaC+WF8
	DAlbUoAYvbrdr7N7IvTh4KkqJna0FDT2HJrIPDmKJx+z+d60MMXw6eY7PThShZrW
	EX6AQPQ1853FejAEtnwqBNNYf65y8aRyBeZrQPPT91GTl1rcmSWCrPuYkWLQGuCo
	CaBqMp341is+e5Ue2v6g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w3ywbrasb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Feb 2024 04:44:52 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4174ipJm000942
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Feb 2024 04:44:51 GMT
Received: from [10.253.13.207] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 6 Feb
 2024 20:44:50 -0800
Message-ID: <19181296-bb2c-40c8-b84c-bec7127b117c@quicinc.com>
Date: Wed, 7 Feb 2024 12:44:45 +0800
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
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vRXuHHk0pHrgonv0CsKJ9pxJNA18Xm1H
X-Proofpoint-GUID: vRXuHHk0pHrgonv0CsKJ9pxJNA18Xm1H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-06_16,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=634 impostorscore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402070033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_204459_638671_429C12C5 
X-CRM114-Status: GOOD (  13.60  )
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
> I recommend in the followup patch checking all the access to
> ar->allocated_vdev_map, fixing that if needed and adding documentation
> to struct ath12k::allocated_vdev_map how it's supposed to be protected.


Will do it in the future.

> 

