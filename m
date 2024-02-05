Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C67FC48292
	for <ath12k@archiver.kernel.org>; Mon,  5 Feb 2024 16:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVBUDGI/7j74ztZpyPUEHLAkWrecmj/YVlNVycV5kaQ=; b=GtS90dZn6UOMtqGpPLAm6hiZi3
	BMzRRx4AJ7lkqypn17L+LMAy6isk3hpEK+0/OFZYgvzTdSvRi5kjEtVAjp9tT/mtqUaHMKDRcSaVW
	s5YVV/6FAI07Rr+a8ppO/kwbqnjiCeNgKSnxx5pKJbNGtTLHpAULmY6mdzEVCSVFmm7fOKb5y3R3y
	gmcn9uiV1uNSvPFQcxzvnYK7wqvWtV9od3eNoL/hsqwa4XXvuiSB/6SHf9TAvdCPOIblgR+TqkiC6
	2YGRqqa2iyPBF6zXiEw5N/WfqabC9XBPPKQfTXA2vZBCG66s6iWiviIFk2x2Rt7Q3j40IcsCY/10C
	z4Muo0PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX1wB-000000040EF-35II
	for ath12k@archiver.kernel.org;
	Mon, 05 Feb 2024 16:35:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX1w8-000000040C3-07hM
	for ath12k@lists.infradead.org;
	Mon, 05 Feb 2024 16:35:14 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 415FU6gS021811;
	Mon, 5 Feb 2024 16:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=VVBUDGI/7j74ztZpyPUEHLAkWrecmj/YVlNVycV5kaQ=; b=Fm
	muM+LXOXsKm/5arGTCbvC6908jaCRhwiLjSx4OVyQsr8lowdiCzQttZV/TSZdeSJ
	04hF5dWOf72J0JTauCDDOY5LG3oqaHtl9LA57faH9sdhBqRlsJU9/nWqg1BDaC9Z
	4Op9rpuMD2apgdSyPXhWHhmfdesUBMi9Ho4QPUa+bDFMONmDmOTScuboRYQajtkR
	Y//QGpAv1xplWab99wKNbWOo3K3FkFlwPJ73r84lSLK/6VifxTiAlf3Yd1pQcxF2
	ek5pYgW2mLGsV4LiUqp3DQzErWC9+LiIB7yhtBhKkORZ1Box3S/NMTY6obqN8oW3
	yUuFY5fU34nAt/TQbHHA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w2rvj9d67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 16:35:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 415GZ8DE030721
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 Feb 2024 16:35:08 GMT
Received: from [10.110.62.200] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 5 Feb
 2024 08:35:08 -0800
Message-ID: <efda8b8e-0257-4779-b0c9-0903164b58c1@quicinc.com>
Date: Mon, 5 Feb 2024 08:35:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/11] wifi: ath12k: add P2P IE in beacon template
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Kang Yang <quic_kangyang@quicinc.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240130040303.370590-1-quic_kangyang@quicinc.com>
 <20240130040303.370590-5-quic_kangyang@quicinc.com>
 <87bk8usx6d.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <87bk8usx6d.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: c1tPlce_qyVSogcM4QXR_gC8bgEHYYpK
X-Proofpoint-GUID: c1tPlce_qyVSogcM4QXR_gC8bgEHYYpK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 mlxlogscore=884 bulkscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402050126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_083512_246070_511BD71F 
X-CRM114-Status: GOOD (  14.51  )
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

On 2/5/2024 8:17 AM, Kalle Valo wrote:
> Kang Yang <quic_kangyang@quicinc.com> writes:
>> +	if (WARN_ON(skb->len < ie_offset))
>> +		return -EINVAL;
>> +
>> +	ie = (u8 *)cfg80211_find_vendor_ie(oui, oui_type,
>> +					   skb->data + ie_offset,
>> +					   skb->len - ie_offset);
> 
> So cfg80211_find_vendor_ie() returns:
> 
> static inline const u8 *
> cfg80211_find_vendor_ie(unsigned int oui, int oui_type,
> 			const u8 *ies, unsigned int len)
> 
> You are casting away the const here. I see that other drivers do the
> same as the assumption is that the pointer points to the same buffer,
> but I still don't really like casting away const. Thoughts?

I'm not a fan of typecasting either.

However, the problem here is that from the perspective of
cfg80211_find_vendor_ie() the buffer is const (not modified in any way
by the function), but from the perspective of every caller the buffer is
part of a message that is in RAM.

So you have to decide if you want to change the prototype to remove the
const from cfg80211_find_vendor_ie() or if you want to keep the current
semantic to cast away the const.

This is one of the rare cases where I think the typecast is ok.

/jeff

