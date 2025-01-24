Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DF6C02182
	for <ath12k@archiver.kernel.org>; Fri, 24 Jan 2025 01:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+/Nzf+wQsYK4CUtFVQexhSIKfVhWoImWUHWAyJwQrE=; b=n0ZgkvIbS91eoFmP2WORHLSNdw
	vVFcHaQt6ILy6ElKPr+SRGJ7iuNgKl8/1O2Ns2KNRapNZTesaXcX91/0baoRne2wC4LS3BxKbtTsa
	z6OBJHNDRx16TcWSR9DgVTVZyC/1YlXGl7nWpf328QSem3BB3vCFXUKUgW1LsYmpYfEP5MmfBMKpG
	E3aEyDx9Fl6Gs8050ddMTxxsqiSnH+8nIu1TmroeKOG9Ol0aXZQNm1IeW0GL3GFbg7+RDYTHqoR2o
	kj7R+NuMC3AKjrn0cP0S/Si27nIQZ8qy8X/4UhcQhIEbyUYOW27hvtF3yq1D1UGdGQiGck2M2nkE2
	tg1Cc5fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb8C2-0000000DdbL-21Gq
	for ath12k@archiver.kernel.org;
	Fri, 24 Jan 2025 01:09:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb8C0-0000000Ddav-0QeL
	for ath12k@lists.infradead.org;
	Fri, 24 Jan 2025 01:09:05 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NLt8Vw023520;
	Fri, 24 Jan 2025 01:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u+/Nzf+wQsYK4CUtFVQexhSIKfVhWoImWUHWAyJwQrE=; b=UfUIQ3/o3It+BhsE
	pKTNKfj3c71tqc+VBzgoDDFlMiK18fH5nHhcpb+KrrvJ20hcXsVq0aQXXFDKwPGE
	GkrwjvVtTNkt0Edrp8WeZdqxti1M97cVJUkaN70RvD4ukOi2PDOqlrJYLPjFrpyZ
	rCFeD01b9JJwcV/0Sk5aNqdRp42b+FhCkY0fUQNvtv8NnwtKDFF58qCUN1jH4rPQ
	Q2M7Ux3W3XevLOD7Y5M2SpZaAYBps+dffXkGJ9hIOXetrgi2poqrd8ZeImnE33k4
	MN27LiaN96T5THWfLrDtlgdLlRV+hBBZS8dPzc1AerXvepXT7U7JPCbF/WMDNCqn
	eTkDpA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bx3u89h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 01:09:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50O191bG023699
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 01:09:01 GMT
Received: from [10.227.108.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 23 Jan
 2025 17:09:00 -0800
Message-ID: <5861c953-436e-4f36-ae8b-5ef52fceb3b6@quicinc.com>
Date: Thu, 23 Jan 2025 17:09:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/9] wifi: ath12k: add support for setting fixed HE
 rate/GI/LTF
To: <mbizon@freebox.fr>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Muna Sinada <quic_msinada@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
References: <20250114003813.2783550-1-quic_pradeepc@quicinc.com>
 <20250114003813.2783550-7-quic_pradeepc@quicinc.com>
 <f5c6d874e9d7682d52c5ed107a0ede952b5cf53f.camel@freebox.fr>
Content-Language: en-US
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <f5c6d874e9d7682d52c5ed107a0ede952b5cf53f.camel@freebox.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IF9h6XQi_JKhNPLwxIosI5ztGv9CIsC7
X-Proofpoint-ORIG-GUID: IF9h6XQi_JKhNPLwxIosI5ztGv9CIsC7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_10,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 mlxlogscore=768 suspectscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 bulkscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_170904_255159_2A3BB054 
X-CRM114-Status: GOOD (  13.61  )
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



On 1/23/2025 3:06 AM, Maxime Bizon wrote:
> 
> On Mon, 2025-01-13 at 16:38 -0800, Pradeep Kumar Chitrapu wrote:
> 
> Hello,
>   
>> @@ -8376,10 +8637,13 @@ static int ath12k_mac_op_add_interface(struct ieee80211_hw *hw,
>>   
>>          for (i = 0; i < ARRAY_SIZE(arvif->bitrate_mask.control); i++) {
>>                  arvif->bitrate_mask.control[i].legacy = 0xffffffff;
>> +               arvif->bitrate_mask.control[i].gi = NL80211_TXRATE_FORCE_SGI;
> 
> can you explain why it's not NL80211_TXRATE_DEFAULT_GI ?
> 
Hi Maxime

I believe, this is default GI based on device capability of HE for 
ath11k or EHT for ath12k.
>>                  memset(arvif->bitrate_mask.control[i].ht_mcs, 0xff,
>>                         sizeof(arvif->bitrate_mask.control[i].ht_mcs));
>>                  memset(arvif->bitrate_mask.control[i].vht_mcs, 0xff,
>>                         sizeof(arvif->bitrate_mask.control[i].vht_mcs));
>> +               memset(arvif->bitrate_mask.control[i].he_mcs, 0xff,
>> +                      sizeof(arvif->bitrate_mask.control[i].he_mcs));
>>          }
>>   
> 
> 
> The same initialization of he_mcs is missing in the ath12k_mac_assign_link_vif()
> 

Thanks for notifying..will fix it in next revision

