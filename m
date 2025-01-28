Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6618CC0218A
	for <ath12k@archiver.kernel.org>; Tue, 28 Jan 2025 18:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gISoOuUG+dJBwBVgVJrUOWhOBwXlzKcp+WmiMBpGu4E=; b=f1jMAnCjcIqr6Yi72wc85KsXuX
	6WQjtx/Q9hlyXozL7ZgcCIBz1fiVGpM+ugcTdr9/NqC83CpMILE0AxVxWOKqG1Y+LZLGbwNF99H7n
	p4Zp4DlWI/vCxBAt2eF57hIie083etw0Vt65Tbqa7NSCNXu4tqdwcv5lAM0HSBYmMzhvmlwGFvoc2
	eOg2SnXSt2RT2WSw6NKhsWGWVvsXUbnguWpZn5QF/0lI/IqA+N3PWzeFTZB/07At7o2S37HJC3BzN
	4f0MVH7P2xKTRbaGO7G0Dj+Omuke55C72clydvU/VM0E6bbU68TBiM7bku11ZDONihlE0sTgFKdNx
	/jQ9r6nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcqZX-00000005cal-0l5n
	for ath12k@archiver.kernel.org;
	Tue, 28 Jan 2025 18:44:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcqZU-00000005caB-1g71
	for ath12k@lists.infradead.org;
	Tue, 28 Jan 2025 18:44:25 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S8hdJZ015113;
	Tue, 28 Jan 2025 18:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gISoOuUG+dJBwBVgVJrUOWhOBwXlzKcp+WmiMBpGu4E=; b=OABeqry1mIih8luE
	82iEwIeEO5SKRdAKTYcvGlmwWej8lCElquT5dSEkwIr+zVxy+JK9UQXrePc6WNmU
	SWwO1RReXe3w7eqkZiosoLF8kajuhIXHkS7xvMCss5t8nhWtlbBOnucQIEuwTOqm
	itEfGA/rZY2sNkiMgJCxdLXqyDJdcs9XZ0i21yg0tvpLFRY39ozTbO9l6R2qjo8G
	9f2ysoDGaduKV6UTgw9vidAJblJuM+5dMXF3etgMaGqlq//IU0U6mFoLoJctTTnb
	GJxmmuTlTaNUZtmUShmlyL74MS9qdtSLKHPDQWgL6bqDLf89l0r2S7f6SH9/x2x+
	tfw9rQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44euyq9cvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 18:44:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50SIiNPb009086
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 18:44:23 GMT
Received: from [10.227.108.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 Jan
 2025 10:44:22 -0800
Message-ID: <238a5082-cfbd-4c2a-9ad8-ab4ae494b09c@quicinc.com>
Date: Tue, 28 Jan 2025 10:44:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/9] wifi: ath12k: add support for setting fixed HE
 rate/GI/LTF
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Muna Sinada <quic_msinada@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
References: <20250114003813.2783550-1-quic_pradeepc@quicinc.com>
 <20250114003813.2783550-7-quic_pradeepc@quicinc.com>
 <b9a81c89-70f0-453c-9619-5d1142bd91d4@oss.qualcomm.com>
Content-Language: en-US
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <b9a81c89-70f0-453c-9619-5d1142bd91d4@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SKYl1RtW2LHATJlSnn2mGxuEoE_SViO9
X-Proofpoint-GUID: SKYl1RtW2LHATJlSnn2mGxuEoE_SViO9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 suspectscore=0 bulkscore=0 mlxlogscore=956
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_104424_449785_D361B804 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
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



On 1/26/2025 11:44 AM, Jeff Johnson wrote:
> On 1/13/2025 4:38 PM, Pradeep Kumar Chitrapu wrote:
> 
> ...
> 
>> +static int
>> +ath12k_mac_set_peer_he_fixed_rate(struct ath12k_link_vif *arvif,
>> +				  struct ath12k_link_sta *arsta,
>> +				  const struct cfg80211_bitrate_mask *mask,
>> +				  enum nl80211_band band)
>> +{
>> +	struct ath12k *ar = arvif->ar;
>> +	u8 he_rate, nss;
>> +	u32 rate_code;
>> +	int ret, i;
>> +	struct ath12k_sta *ahsta = arsta->ahsta;
>> +	struct ieee80211_sta *sta;
>> +
>> +	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
>> +
>> +	sta = container_of((void *)ahsta, struct ieee80211_sta, drv_priv);
> 
> we have a helper for this so please use it:
> 
> 	sta = ath12k_ahsta_to_sta(ahsta);
> 
Sure..thanks Jeff, will address in next revision

