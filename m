Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE01EC02194
	for <ath12k@archiver.kernel.org>; Fri,  7 Feb 2025 18:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62U43CWQ85bcTSG0zmifYLZOS2pGijYoAOm9rAX5t2E=; b=G+GbKuFnsEAHrJvcX0IAMBjOfa
	i0qVrmvU5CfCAEhPgCHPr6GeMG0umpgCZq66C75cpPdWPAG3ENmlCzCkVlPlh1flq76/NES+y8vci
	0FAU25iJYOQmoHR+HGAVbijPLGBREqy6huz7yHm7/XErBZOujESX32lbXWKeyd4OcuMo4kg9Z6jkf
	0Lg+vF5EivjUxaES1xBWMVZZbBrrh5zMYJYk49Tk6i3DTQiBZVQAwyn82akoLu9bvVsM7nGzITb+/
	zLPJIuSOAyMX/vKtGBqmIFadobydO7Xp67kIpu643RoB6+0gKZRaSvzCRbpJaXPDvdTdjvaC7V186
	CeXfLBRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTTr-0000000AoBW-1sOu
	for ath12k@archiver.kernel.org;
	Fri, 07 Feb 2025 18:53:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTTg-0000000Ao87-3OFz
	for ath12k@lists.infradead.org;
	Fri, 07 Feb 2025 18:53:26 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517BNXVD032180
	for <ath12k@lists.infradead.org>; Fri, 7 Feb 2025 18:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	62U43CWQ85bcTSG0zmifYLZOS2pGijYoAOm9rAX5t2E=; b=Tnk+V2mD3QMFuS7N
	VJe36pwhoBa35mH8lzukiY99WuTgNpEgWgm/PjKmozlhXU4rMxtOmep4bOuMjlB9
	9qYguoo0n0xNXbCUY2t5nAuOMC0XtPArH9WrUQ7xbaY2t4ARl4h1A4lUZUkk36MU
	6DSHUCPR27L/tYs4lvRgQJ7CfT6EptAfz+ezYiS2cY9nVbX82a4qf9fWGunIVsdn
	DMg4eEFsVXL8wWAn2gZcAVssBTzKdiecKVK9MbGv7FYs0O3o3mu4Bhdeb/5JveLs
	+zF57ULCBIRKng7j2/bgRVaF2Zv6h52eTNZEBzO2Da1GhzorvSGHoI6f6uw6QhhA
	Kk5scQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nh8us3as-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 07 Feb 2025 18:53:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-21f5ae4d62dso20079895ad.0
        for <ath12k@lists.infradead.org>; Fri, 07 Feb 2025 10:53:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738954403; x=1739559203;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=62U43CWQ85bcTSG0zmifYLZOS2pGijYoAOm9rAX5t2E=;
        b=b5anEIBm+r2tmQ/ecGsR4ZnasvhvSRJrQH8IPhTp3mwZb0wyFFbbfP3X/rrcB6GKdG
         5P4YmxlmDy9cikvqTVJdTh7UUcn7yqujShR3zt1w4EFz4GW0i+6Uy7Z0fsNyAVOtVueA
         dbtkzIMQbdJISJZf5HnlZTTq988C/oZBYSycG8loAEE83TV0TMpc1g3wBWh09XUBNBrd
         JsXNo6Rf9TmyhmJ5JfGuhZgHdNYGsRszA1VuDtSnkaR5GGV3AJ2wGqxzpzami8Gp+bVU
         d8eHD5Q3Q+BcnLtmufkIyi26nky9OAgc7dqwp4UW/sjYXDV0bUw9kv+tDaLgJ+lrrrYd
         k3iw==
X-Forwarded-Encrypted: i=1; AJvYcCVfFg9Ms5gnxqsMq6Zv/eIpEmqn2fVch1/5Lv3slMA1Ts6Hte/1CDQF5PjHQv1jlj28mXbnuPY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+0I4aXLbjf64aC6qUzw6/W8fcdpk08EcEQpKQe0bXn3jtoWy1
	4UHDMwNSTyMiplbOoQ2mnMxRyvOznt8+kJaItIWbNHGtLWExeG3tjkEeLCkdseDD1Re6+2xtQgO
	qmqrunTySnvsvDY1i8VxF4L8oEFgV67VJSjzetEexUS8UTCyGubt6rJu57MYU
X-Gm-Gg: ASbGncuk2b3rcxhvSgn698RlBMyBYt9R3umhXaaTG6GOuv4KI1FjQLWESfceG36GhFx
	KEIZCM6oq2vch7v1kAB2JEM2DzKEmJ1CdzPvB+6detj/B7GqeephR9Y8ch51LA+/mC/nnPYYccV
	/nWU265FfxyoAVPyjplcLqtDx85E91BjzvmG6ij1EaylGmRqRy8shiCCF7BCamXpaxwPiaUlfcr
	xJbUJF9WKY2KWXf8pv6Y2QvtyGao3e/g8WuFiWKEQYn9mVw+7oiTYq57Fz7UfZ92NNTihNmn4Fq
	4H4btslx1rxTDOOLlrfyNEJNUdy7GUSB6DSSJ4um/sTbkBKUW8nmc4ROcgwsBKhcfnTrXhKcLQ=
	=
X-Received: by 2002:a17:902:f551:b0:215:a179:14ca with SMTP id d9443c01a7336-21f4e1c8d18mr74899645ad.2.1738954403078;
        Fri, 07 Feb 2025 10:53:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOsePrihm3NpzSVHZOlBY12jj1paNWwIKlb89H94n0dQQE1LqorQY8+Kv/encc8DMPG6IvkA==
X-Received: by 2002:a17:902:f551:b0:215:a179:14ca with SMTP id d9443c01a7336-21f4e1c8d18mr74899225ad.2.1738954402703;
        Fri, 07 Feb 2025 10:53:22 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3650ec92sm33843475ad.17.2025.02.07.10.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 10:53:22 -0800 (PST)
Message-ID: <7ee0f7fd-7a3d-4942-8323-08ff9c4c8915@oss.qualcomm.com>
Date: Fri, 7 Feb 2025 10:53:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Abort scan before removing link interface
 to prevent duplicate deletion
To: Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
References: <20250124093352.481-1-quic_lingbok@quicinc.com>
 <44dc86f0-7775-4d47-9058-17cb048cd976@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <44dc86f0-7775-4d47-9058-17cb048cd976@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DeqrQspqONAZ7VMIaT71deJysG_Pjfli
X-Proofpoint-ORIG-GUID: DeqrQspqONAZ7VMIaT71deJysG_Pjfli
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_09,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_105324_866934_A40B5906 
X-CRM114-Status: GOOD (  20.08  )
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

On 2/7/2025 1:04 AM, Lingbo Kong wrote:
> 
> 
> On 2025/1/24 17:33, Lingbo Kong wrote:
>> Currently, when ath12k performs the remove link interface operation, if
>> there is an ongoing scan operation on the arvif, ath12k may execute the
>> remove link interface operation multiple times on the same arvif. This
>> occurs because, during the remove link operation, if a scan operation is
>> present on the arvif, ath12k may receive a WMI_SCAN_EVENT_COMPLETED event
>> from the firmware. Upon receiving this event, ath12k will continue to
>> execute the ath12k_scan_vdev_clean_work() function, performing the remove
>> link interface operation on the same arvif again.
>>
>> To address this issue, before executing the remove link interface
>> operation, ath12k needs to check if there is an ongoing scan operation on
>> the current arvif. If such an operation exists, it should be aborted.
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/mac.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
>> index 329c05003721..cdce88787182 100644
>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>> @@ -9333,6 +9333,11 @@ ath12k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
>>   	    ar->num_started_vdevs == 1 && ar->monitor_vdev_created)
>>   		ath12k_mac_monitor_stop(ar);
>>   
>> +	if (ar->scan.arvif == arvif && ar->scan.state == ATH12K_SCAN_RUNNING) {
>> +		ath12k_scan_abort(ar);
>> +		ar->scan.arvif = NULL;
>> +	}
>> +
>>   	ath12k_mac_remove_link_interface(hw, arvif);
>>   	ath12k_mac_unassign_link_vif(arvif);
>>   }
>>
>> base-commit: 376673aa393c1c232299be3e910d7f2e6d974b2f
> 
> hi jeff,
> do you have any updates on this patch?🙂

while this patch applies cleanly to ath/main, it does not apply cleanly to the
current ath/pending, conflicting with:

https://msgid.link/20250204-unlink_link_arvif_from_chanctx-v2-8-764fb5973c1a@oss.qualcomm.com

that patch relocates the adjacent lines:
   	ath12k_mac_remove_link_interface(hw, arvif);
   	ath12k_mac_unassign_link_vif(arvif);

so should this logic stay in ath12k_mac_op_unassign_vif_chanctx() or should it
also be relocated to ath12k_mac_op_change_vif_links()?

/jeff

