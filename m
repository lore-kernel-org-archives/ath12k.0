Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F8EC25B75
	for <ath12k@archiver.kernel.org>; Thu, 23 May 2024 12:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=neeT+MSnzUXdAVDbknPxIq3Mmqtbo3Id/s1ti+eEzyQ=; b=pFUb+XGbsb4Ano46JkJchpiee1
	Zz2jZF4vki5lGidB9XoGIC5j+AZscyj57/1ZJI9T6529FdOTgf5o8i7O3bjojVlosQVG6bTqecEy2
	IamHJmdIQTTlmRMpuSclRN/zTebPyN4n997Rhe4n2yqxXkZp9qO2EZ6OSW4d2aesLmG3DDqE0jh3a
	f9yaBv8I3E1yZ1P95lxvxegDPPxRV8l11yP5McoBrztDq3xQW4+tk2Bgkq/0WBIMxZwQgv2p47/Mt
	5NCqJEk1xG70dC9c3pHnVXnXVG2YVJUsD7e1ueQ0tY2MRnNFlJPsZCyOQ7fPVTE1uzoWV7rxEBXgx
	l9vVIcGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7f2-00000006Cd5-1dIE
	for ath12k@archiver.kernel.org;
	Thu, 23 May 2024 12:35:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7ez-00000006Cc6-3gca
	for ath12k@lists.infradead.org;
	Thu, 23 May 2024 12:35:07 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44N4bGfO016987;
	Thu, 23 May 2024 12:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	neeT+MSnzUXdAVDbknPxIq3Mmqtbo3Id/s1ti+eEzyQ=; b=ig7WbGCklBUlqTdB
	zk9Qny29R+nV92G9iaeATV4IhDoJ+IcOq5k8ntReFirR+vs9mHmX+PG+hEezHQv6
	GxewyWZ4vXNMUO/4Rzd+GrAQeYdB5FDTlMMPxXI99chGvlAsctOKyrLExblkiI2d
	irMDpbpksNTx7duXVIFcUSxCqYBw2KNuIH9l2hJRY+eYq0y092moW6ZWrcEwsAJ3
	KHAi+vT+8hX9vFos5t97Yj6lTsK4FyFH+7OseleUaff9X0aWFA1lWCeOcXgaMRG+
	VaFcKe/vWhpf2wWWjqts8kZ/0guI4ExB6l4dEpftAh1VB3UlZQ7cxw07+4+aC1kw
	SCBsCQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y9xxe132m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 12:34:57 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44NCYvuL014132
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 12:34:57 GMT
Received: from [10.111.164.21] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 23 May
 2024 05:34:54 -0700
Message-ID: <667cea80-9b62-4ca4-9d28-c5940582832a@quicinc.com>
Date: Thu, 23 May 2024 20:34:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] wifi: ath12k: Fix Pdev id in HTT stats request for
 WCN7850
To: Kalle Valo <kvalo@kernel.org>,
        Ramya Gnanasekar
	<quic_rgnanase@quicinc.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240510050806.514126-1-quic_rgnanase@quicinc.com>
 <20240510050806.514126-4-quic_rgnanase@quicinc.com>
 <87pltfd2bt.fsf@kernel.org>
Content-Language: en-US
From: Lingbo Kong <quic_lingbok@quicinc.com>
In-Reply-To: <87pltfd2bt.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: M_CjQGxzG1d3pelguyx2s44pdlNcLWGQ
X-Proofpoint-ORIG-GUID: M_CjQGxzG1d3pelguyx2s44pdlNcLWGQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_07,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405230086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_053505_968358_B60F26E2 
X-CRM114-Status: GOOD (  17.16  )
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



On 2024/5/21 15:57, Kalle Valo wrote:
> Ramya Gnanasekar <quic_rgnanase@quicinc.com> writes:
> 
>> From: Lingbo Kong <quic_lingbok@quicinc.com>
>>
>> Pdev id from mac phy capabilities will be sent as a part of
>> HTT stats request to firmware. This causes issue with single pdev
>> devices where fimrware does not respond to the stats request
>> sent from host.
>>
>> Single pdev devices firmware expects pdev id as 1 for 5GHz/6GHz
>> phy and 2 for 2GHz band. Handle pdev id for single phy device
>> while sending HTT stats request message to firmware.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
>> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
> 
> [...]
> 
>> @@ -1029,7 +1030,12 @@ ath12k_dp_tx_htt_h2t_ext_stats_req(struct ath12k *ar, u8 type,
>>   	memset(cmd, 0, sizeof(*cmd));
>>   	cmd->hdr.msg_type = HTT_H2T_MSG_TYPE_EXT_STATS_CFG;
>>   
>> -	cmd->hdr.pdev_mask = 1 << ar->pdev->pdev_id;
>> +	if (ab->hw_params->single_pdev_only)
>> +		pdev_id = ath12k_mac_get_target_pdev_id(ar);
>> +	else
>> +		pdev_id = ar->pdev->pdev_id;
> 
> Wouldn't it be cleaner to have the single_pdev_only check in
> ath12k_mac_get_target_pdev_id()?
> 

yes, i'll put the single_pdev_only check in 
ath12k_mac_get_target_pdev_id() function.

>> +struct ath12k_vif *ath12k_mac_get_vif_up(struct ath12k_base *ab)
>> +{
>> +	struct ath12k *ar;
>> +	struct ath12k_pdev *pdev;
>> +	struct ath12k_vif *arvif;
>> +	int i;
>> +
>> +	for (i = 0; i < ab->num_radios; i++) {
>> +		pdev = &ab->pdevs[i];
>> +		ar = pdev->ar;
>> +		list_for_each_entry(arvif, &ar->arvifs, list) {
>> +			if (arvif->is_up)
>> +				return arvif;
>> +		}
>> +	}
>> +
>> +	return NULL;
>> +}
> 
> I'm not seeing any protection here, is that on purpose?
> 

you means there need to add lockdep_assert_held(&ar->conf_mutex)?

>> +u8 ath12k_mac_get_target_pdev_id(struct ath12k *ar)
>> +{
>> +	struct ath12k_vif *arvif;
>> +
>> +	arvif = ath12k_mac_get_vif_up(ar->ab);
>> +
>> +	if (arvif)
>> +		return ath12k_mac_get_target_pdev_id_from_vif(arvif);
>> +	else
>> +		return ar->ab->fw_pdev[0].pdev_id;
>> +}
> 
> No need to have else after return.
> 

