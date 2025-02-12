Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F53C02198
	for <ath12k@archiver.kernel.org>; Wed, 12 Feb 2025 21:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Ryu3ptL+EMDBx+GUb3VpsVV5oHbM8w70U5KImMU56w=; b=H2nIO7VdkG9J2Co4x/Z7CeUAi4
	w2Ay1PdGFXqQ2ml2ErpsQTiPyoDCjsR+H6i6RpodWwzYw7yqCl9Ju46xq/ITYhCdw9hggoiIdxTae
	CuOIdCuNPpAm3YuDfneH8QOryanF4FdaoKDoyYb2AGiEVERvW6SmBBrD9E09Bnv8kppqHgjB4ioeZ
	3J42nNBHSEsXtYZgKjcNcVvh84NaoxualL+j6SWsfoDBdXEX5BAym2wz0VvoBoiuSoUDZvEuKP2hi
	prf7vmTv2KtgJA+wa0RMcEtb7ot20mBNhM6LPYF925aPnxaqvP6T0/vGxgSaD04Bkl2gh7iftdGEs
	5TElpewg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiKMm-00000008uSA-0jt7
	for ath12k@archiver.kernel.org;
	Wed, 12 Feb 2025 21:33:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiKMj-00000008uRn-308i
	for ath12k@lists.infradead.org;
	Wed, 12 Feb 2025 21:33:54 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CL8NMn014045;
	Wed, 12 Feb 2025 21:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Ryu3ptL+EMDBx+GUb3VpsVV5oHbM8w70U5KImMU56w=; b=NZsDzPCHSfq+O/Hm
	jCsO06u8BG0Gy1np1rzQ+J34HJNx1Oyo8qqr2OSwswjjb3dO70WUdlA3HRZMiClg
	IAzTB9JF7XGAQm2iZq+PylKEBAtyRfmxuo9f8Ab7bDsoRJUtv/UYmVM57jOanG1d
	8uiPY59bdSnnqGN+F2O4zi/fGW5UekSB4VNtsqsV7teBIPNSGkoalONAl9eWgqHO
	nVMiuSv7AFpqYEMCFsINWmdT2DDtUZR4pjazW2hrhCCo1iCuMeaoPlHyDPuefjm3
	GvCLgXveBlHnKA0gqxftRpV9YHPK5VcGzra2LJJ+gIkDzLzW/KQv1y0HGQQOF3iA
	K2dJrg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rsd7sptb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 21:33:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51CLXoqq001350
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 21:33:50 GMT
Received: from [10.110.103.217] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Feb
 2025 13:33:50 -0800
Message-ID: <0fba46da-0ff8-4fc4-ba69-eaeb2e25f109@quicinc.com>
Date: Wed, 12 Feb 2025 13:33:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/9] wifi: ath12k: clean up 80P80 support
To: <mbizon@freebox.fr>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
References: <20250114003813.2783550-1-quic_pradeepc@quicinc.com>
 <20250114003813.2783550-8-quic_pradeepc@quicinc.com>
 <bddeb2c0867139e801845c65a78fd415460bd398.camel@freebox.fr>
Content-Language: en-US
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <bddeb2c0867139e801845c65a78fd415460bd398.camel@freebox.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tSSuGZ0JB8s8PVpHu3nkSlpxj6ST-sQq
X-Proofpoint-GUID: tSSuGZ0JB8s8PVpHu3nkSlpxj6ST-sQq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_06,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 mlxlogscore=949 mlxscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_133353_757454_0BEE45D0 
X-CRM114-Status: GOOD (  12.30  )
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



On 2/3/2025 2:28 AM, Maxime Bizon wrote:
> 
> On Mon, 2025-01-13 at 16:38 -0800, Pradeep Kumar Chitrapu wrote:
> 
> Hello,
> 
>> @@ -2859,16 +2848,11 @@ static enum wmi_phy_mode ath12k_mac_get_phymode_vht(struct ath12k *ar,
>>                                                      struct ieee80211_link_sta *link_sta)
>>   {
>>          if (link_sta->bandwidth == IEEE80211_STA_RX_BW_160) {
>> -               switch (link_sta->vht_cap.cap &
>> -                       IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_MASK) {
>> -               case IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ:
>> -                       return MODE_11AC_VHT160;
>> -               case IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ:
>> -                       return MODE_11AC_VHT80_80;
>> -               default:
>> -                       /* not sure if this is a valid case? */
>> +               if (link_sta->vht_cap.cap &
>> +                   IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ)
>>                          return MODE_11AC_VHT160;
>> -               }
>> +
>> +               return MODE_UNKNOWN;
> 
> 
> This breaks VHT 160Mhz for STA with NSS restriction.
> 
> Those don't set VHT_CAP_SUPP_CHAN_WIDTH_160MHZ (see
> IEEE80211_VHT_EXT_NSS_BW_CAPABLE)
> 
Thanks Maxime..will fix this in 7/9 and 8/9 patches

