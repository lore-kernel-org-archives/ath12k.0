Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED478C4828F
	for <ath12k@archiver.kernel.org>; Wed,  7 Feb 2024 04:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsfvL1orhfSM92OZrydbgJoiHsV+bhzutSRQMeeKJM4=; b=g3YK/3ZQQAknFT80JlFBDkZjT/
	XFxszYm3W+Qm6BljQ01ZPsfFMTtkmLbcFIWnb8S3nZzNBUMf2GWVVJuNMZh4hnmzaVd1V3pNsL+yo
	Qar6DUsAsTze4j57fNuNzAIwutaJ1SW85j/1MIiRKNJ7cy15MSH4blinxnDG4apk1WcqU2NfbIz2O
	UDuvLX13KNw/qyl+dJU0s17pobHBaFWubgxuqs6MT7dufrKl26+I/DHd6cCFR82Euvqq9THKkIIWF
	ZuZML2nqiZMX+1hkBlxlrmM/Vcf1iyOC1GkCktPhlHZ7umofpU9tsD5qgyVhkbT4ldo/ayyEJGKvX
	ULmUnqLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXZfV-00000009fUc-2MVz
	for ath12k@archiver.kernel.org;
	Wed, 07 Feb 2024 04:36:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXZfS-00000009fUD-0vlB
	for ath12k@lists.infradead.org;
	Wed, 07 Feb 2024 04:36:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 417301n6020477;
	Wed, 7 Feb 2024 04:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=lsfvL1orhfSM92OZrydbgJoiHsV+bhzutSRQMeeKJM4=; b=C0
	SSRUr2PwBVL64I7RPayqbW8N6O4R3raq0pDT5d/ti3XpIQniAZpENNd2uTlaCZhf
	ax2bGjRCaJ+K4CEWKNiQ/xpR/hWlBLUMoZuPiTrsBNwt3/HJpg8irPb2K98hcnBM
	xIMwu+/sCi/ERcuqfssAXHwRGtCwE1VKrH9riwhSRlozJLPX1wAZe8LxMo2mh/+P
	BVf9oPOzBXNcWJEssOI6NlNmj2v7186/9EReEqgNAcy6T7J3zgLqnIApg7hPd3TD
	iUzkAm+oxp5UnWhV9ik0tJxd1kWqoWJ19JLeQotJnBmN3dDe2SPvwpY5svc4Lq8U
	b7PU7PfUI0pcf2VgN1oA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w3ugngt6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Feb 2024 04:36:07 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4174a6Jw021527
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Feb 2024 04:36:06 GMT
Received: from [10.253.13.207] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 6 Feb
 2024 20:36:05 -0800
Message-ID: <f2feaa66-52f1-4a13-bf69-5033bd0cd919@quicinc.com>
Date: Wed, 7 Feb 2024 12:36:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/11] wifi: ath12k: implement handling of P2P NoA
 event
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240130040303.370590-1-quic_kangyang@quicinc.com>
 <20240130040303.370590-6-quic_kangyang@quicinc.com>
 <87plx9r2rp.fsf@kernel.org>
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <87plx9r2rp.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7UAjuC_oV5ZRrOmDdQzMhDUzCaIfvE7u
X-Proofpoint-GUID: 7UAjuC_oV5ZRrOmDdQzMhDUzCaIfvE7u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-06_16,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402070032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_203614_305335_CDF5818C 
X-CRM114-Status: GOOD (  14.58  )
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



On 2/7/2024 12:11 AM, Kalle Valo wrote:
> Kang Yang <quic_kangyang@quicinc.com> writes:
> 
>> The NoA(Notice of Absence) attribute is used by the P2P Group Owner to
>> signal its absence due to power save timing, concurrent operation, or
>> off-channel scanning. It is also used in the P2P Presence Request-Response
>> mechanism.
>>
>> The NoA attribute shall be present in the P2P IE in the beacon frames
>> transmitted by a P2P Group Owner when a NoA schedule is being advertised,
>> or when the CTWindow is non-zero.
>>
>> So add support to update P2P information after P2P GO is up through
>> event WMI_P2P_NOA_EVENTID, and always put it in probe resp.
>>
>> Create p2p.c and p2p.h for P2P related functions and definitions.
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> 
> [...]
> 
>> +static int ath12k_wmi_p2p_noa_event(struct ath12k_base *ab,
>> +				    struct sk_buff *skb)
>> +{
>> +	const void **tb;
>> +	const struct wmi_p2p_noa_event *ev;
>> +	const struct ath12k_wmi_p2p_noa_info *noa;
>> +	struct ath12k *ar;
>> +	int ret, vdev_id;
>> +
>> +	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
>> +	if (IS_ERR(tb)) {
>> +		ret = PTR_ERR(tb);
>> +		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ev = tb[WMI_TAG_P2P_NOA_EVENT];
>> +	noa = tb[WMI_TAG_P2P_NOA_INFO];
>> +
>> +	if (!ev || !noa) {
>> +		kfree(tb);
>> +		return -EPROTO;
>> +	}
>> +
>> +	vdev_id = __le32_to_cpu(ev->vdev_id);
>> +
>> +	ath12k_dbg(ab, ATH12K_DBG_WMI,
>> +		   "wmi tlv p2p noa vdev_id %i descriptors %u\n",
>> +		   vdev_id, le32_get_bits(noa->noa_attr, WMI_P2P_NOA_INFO_DESC_NUM));
>> +	ar = ath12k_mac_get_ar_by_vdev_id(ab, vdev_id);
>> +	if (!ar) {
>> +		ath12k_warn(ab, "invalid vdev id %d in P2P NoA event\n",
>> +			    vdev_id);
>> +		return -EINVAL;
>> +	}
> 
> Aren't we leaking tb here? In this function I revamped the error
> handling to use the out label to make sure we are freeing tb in every
> error. Please review:

Yes, i forget to free(tb) here, thanks!


> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=12e182b47078a48169e873c51d438d7417e7e0c8
> 

