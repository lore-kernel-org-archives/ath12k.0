Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFABC001CC
	for <ath12k@archiver.kernel.org>; Thu, 11 Apr 2024 18:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qFLKA5s4ZScGNbJySHx0GJT+0skUyXTIdyR3J9uMtwY=; b=IjrHquverubD3zfES1Cnk4wbGz
	pGQ/Y1VKtYh3yDF4U9VLCaQHPBfd2bHsxyRRuHfdVImkhkXUb/xhoSiXoPCuzrCKw5YyPy4H7mXia
	urSU4NCA/awJpGGMWbATfV+OvRVVEt586UD1XlAzmcMgoPmCxz8+Xlq1u9aI1NxssFsoRnpHipxIz
	xSwv+YEy6FWEdMHG7uI9q7U7MJu+aOd9p8JvyzGzO0UFxa0zeq3KM7R1Han2b2MPOtI60kRYUbX2+
	h44kis0h0TYW0IHEk9uEbP9jmsLVnAIxUN6CEusgDmkQvAssipLcEL9zSwyDOBvmuPdUpghd0ssU9
	1F2WCH8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruyjH-0000000DXgu-3xKm
	for ath12k@archiver.kernel.org;
	Thu, 11 Apr 2024 18:00:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruyjD-0000000DXcc-48tm
	for ath12k@lists.infradead.org;
	Thu, 11 Apr 2024 18:00:54 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43BDYf04011107;
	Thu, 11 Apr 2024 18:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=qFLKA5s4ZScGNbJySHx0GJT+0skUyXTIdyR3J9uMtwY=; b=IL
	KX1iH7vYMBs4CVaVwElianSNse7hB5VmzJKMeV1ZhsEwSlBZzquE4dZGRYijFxWR
	vVkDtkJXD2Wo1CAuhy/K4wpWa8KvvqmiAY1bf8wZcEXuZ9riumOK39ZeBJNdwnU9
	DF2NgKp2J9snjooIjQRU+zH/BHpfqDoofHEaIyjpbCxDwjMR4dSPGy9vU/BMJ2+g
	cmzOvXbqRMR7vskBfgg5Skoz9iNyj+UHzLtd8zD0yq1oW/lVnSGupfBd4KkEmJfF
	naZjfRXmHxnqNo1K/q5tfOyFvWs5rPYd0CZy/X8VfKreuUeWuY/kCFstbYf2Iq6v
	jYVFwmCJiFLD/4D3h6RA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xedugsc9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 18:00:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BI0jcS018132
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 18:00:45 GMT
Received: from [10.216.26.172] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 11 Apr
 2024 11:00:43 -0700
Message-ID: <eac79cf1-680e-5c5c-2c24-5e7bc1414fc1@quicinc.com>
Date: Thu, 11 Apr 2024 23:30:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] wifi: ath12k: fix mac id extraction when MSDU
 spillover in rx error path
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
References: <20240329092432.873710-1-quic_nithp@quicinc.com>
 <87bk6gz1jc.fsf@kernel.org>
From: Nithyanantham Paramasivam <quic_nithp@quicinc.com>
In-Reply-To: <87bk6gz1jc.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Xc3pw6alwEHSJ5ihZ7T6qcn1PISj7u6L
X-Proofpoint-ORIG-GUID: Xc3pw6alwEHSJ5ihZ7T6qcn1PISj7u6L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_10,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=567 impostorscore=0 clxscore=1011
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404110131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_110052_397423_603422CA 
X-CRM114-Status: GOOD (  16.50  )
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

On 4/11/2024 3:03 PM, Kalle Valo wrote:
> Nithyanantham P <quic_nithp@quicinc.com> writes:
> 
>> From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>>
>> Currently, in the rx error data path, mac id is extracted from the
>> last 64bits of MSDU end description tag for each entry received in
>> the WBM error ring. Then, each entry will be updated into the MSDU
>> list for further processing. The extracted mac id is valid when a
>> single MSDU is not fragmented and received in the WBM error ring.
>>
>> In scenarios where the size of a single MSDU received exceeds the
>> descriptor buffer size, resulting in fragmented or spillover MSDU
>> entries into the WBM error ring. In this case, the extracted mac id
>> from each spillover entry is invalid except the last spillover entry
>> of the MSDU. This invalid mac id leads to packet rejection.
>>
>> To address this issue, check if the MSDU continuation flag is set,
>> then extract the valid mac id from the last spillover entry.
>> Propagate the valid mac id to all the spillover entries of the single
>> MSDU in the temporary MSDU list(scatter_msdu_list). Then, update this
>> into the MSDU list (msdu_list) for further processing.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>> Signed-off-by: Nithyanantham P <quic_nithp@quicinc.com>
> 
> [...]
> 
>> @@ -3807,16 +3816,50 @@ int ath12k_dp_rx_process_wbm_err(struct ath12k_base *ab,
>>   			continue;
>>   		}
>>   
>> +		msdu_data = (struct hal_rx_desc *)msdu->data;
>>   		rxcb->err_rel_src = err_info.err_rel_src;
>>   		rxcb->err_code = err_info.err_code;
>> -		rxcb->rx_desc = (struct hal_rx_desc *)msdu->data;
>> -
>> -		__skb_queue_tail(&msdu_list, msdu);
>> -
>>   		rxcb->is_first_msdu = err_info.first_msdu;
>>   		rxcb->is_last_msdu = err_info.last_msdu;
>>   		rxcb->is_continuation = err_info.continuation;
>> +		rxcb->rx_desc = msdu_data;
>> +
>> +		if (err_info.continuation) {
>> +			__skb_queue_tail(&scatter_msdu_list, msdu);
>> +		} else {
>> +			mac_id = ath12k_dp_rx_get_msdu_src_link(ab,
>> +								msdu_data);
>> +			if (mac_id >= MAX_RADIOS) {
>> +				dev_kfree_skb_any(msdu);
>> +
>> +				/* In any case continuation bit is set
>> +				 * in the previous record, cleanup scatter_msdu_list
>> +				 */
>> +				ath12k_dp_clean_up_skb_list(&scatter_msdu_list);
>> +				continue;
>> +			}
>> +
>> +			if (!skb_queue_empty(&scatter_msdu_list)) {
>> +				struct sk_buff *msdu;
>> +
>> +				skb_queue_walk(&scatter_msdu_list, msdu) {
>> +					rxcb = ATH12K_SKB_RXCB(msdu);
>> +					rxcb->mac_id = mac_id;
>> +				}
>> +
>> +				skb_queue_splice_tail_init(&scatter_msdu_list,
>> +							   &msdu_list);
>> +			}
>> +
>> +			rxcb = ATH12K_SKB_RXCB(msdu);
>> +			rxcb->mac_id = mac_id;
>> +			__skb_queue_tail(&msdu_list, msdu);
>> +		}
>>   	}
> 
> The else branch can be avoided with continue. I did that in the pending
> branch, please check my changes:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=6c677d91adad4817e7f6ef65a85331f52f0237ee
> 
LGTM.

