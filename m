Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDC6E83856
	for <ath12k@archiver.kernel.org>; Tue, 17 Feb 2026 05:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KhEwYEVHGeSfIYaTq9pN0sRx7U6U0doOq8x0/hOejE=; b=KSeujLzN0S2r+ux5UT84tUxBKJ
	xjJvce55gFFDajLhkrEOoLABF4rvbye8pEu0Hhm4t4JvsZyH1xOXyMfbkT6UcrubgxTHq6GEALf+6
	ICofrstKxPD++Fz6a1j10Ku1cICbba/WpN3nDkK81uTl6SiBquC5DOUI37AkrVgew2BCQK4hGOX3O
	xKGbU8aA30vB3pjdErPSOk3fuuCL6zu2WDcFSjNP6q2CoAf91n1q3rJuEWGtV+41SndNI0CuiYt53
	FgFCyR5FkiKZ3c/vQwaUWSq80kZvlUv7g1Ncg6F5EHU+hNgs480NmTKNDxn3jq3eeqkfjtlZY9wiv
	PSUQJ4qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsDnl-00000007ebB-0UyL;
	Tue, 17 Feb 2026 05:39:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsDnh-00000007eal-3vFZ
	for ath12k@lists.infradead.org;
	Tue, 17 Feb 2026 05:39:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GH4swr985641
	for <ath12k@lists.infradead.org>; Tue, 17 Feb 2026 05:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1KhEwYEVHGeSfIYaTq9pN0sRx7U6U0doOq8x0/hOejE=; b=UjANaizP0KlPUoPA
	4WKv4xjn0AOpCTuWP/WPHbRGMZ6mgZSlNRM9ZhSgbuZ5Rfbxg+M21hyBKOUs5xQ4
	2AlNaF45FiozclRW1Nkj69JPzWGlbWtnVsCz7Wv4F9KvWoS1cLOgqH+ZdXskrQVo
	K/+PyWVN4t/Ja3MXHUmbuNFt2g0KNsy/vkIyPlhR350QZ7nvmCuNRcCN4cMKu7F1
	gy08mfr4fO2rfIiA1jkPBC3VuoByqkicOcUYTfeJkVj7hl+7TaBdIFRu8ybAzI4M
	dQ1EN2V1QqiPhpnKeJ05JbUtFUwNvFPYwHZRnWnLjqP50PTGOxxWVKByx8I4mzpg
	NIz+xg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ap15yy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 17 Feb 2026 05:39:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a8fc061ce1so214777045ad.0
        for <ath12k@lists.infradead.org>; Mon, 16 Feb 2026 21:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771306746; x=1771911546; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1KhEwYEVHGeSfIYaTq9pN0sRx7U6U0doOq8x0/hOejE=;
        b=NrJ2Gy3e27vuLl/4n63FjVqZVWx7X7bx9DTIEhyiC5k6FN6wjmzSKAlcsXVf0rPJhF
         FO9H3KTV2D5tJg31X3ogboOp2EuJKFUaLOW4cMdFzDkfC0LqHNq4kZjrdaLO+wdbgHo1
         H4aHh4X6m5m326APGWyNo6DDsZJb2aptFvzkPfMdJDVrgo7QgrhGq9PT8dOwpUHoBsPB
         FUCmC9S7Wb4StFjkHR5/UJjc0hoMglvbrEVHz9foAODC6TSGEGZhjkJmu7VYBO8/uvaa
         cv+IEYM2nQKb/ne+guyTzKoOqfhg+KsXY0bdMJcPohPo0pfpq/pUMigyN46uPrF5a3KF
         ddpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771306746; x=1771911546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1KhEwYEVHGeSfIYaTq9pN0sRx7U6U0doOq8x0/hOejE=;
        b=VxI7butoArkrFPxkrVyk724G5w9UF26DHPvfZHATAB76qdPzevQEjUiFIwwVt45eYt
         +7mZAkX9LCMuThD8aQ2bDLGKCDsN0KSvdwSoxgKL24ljdXrZ8TOQSdA7phVNzwDHdle9
         nbHoRVzu8/iUUyKrnXv51pOCMmZVhEKfzKrnExYrNU1UoWuaSyhSR1850C9lQR/9XGvl
         4xvP+76kpJmwdv1aEz5mzDRaxeq9Sf5O7DaSYGTa0JLd0c3/3EGYH2NV9mCZymdEUA+E
         +YMdaK7KK6EJtU5fD9v+bQfmQSNRqelLc3rO99hlJFdxk6ggJsBZdcnqkMZNUA4YQdyT
         lLCg==
X-Forwarded-Encrypted: i=1; AJvYcCXpt9zpbF+izACuyHB1G2f4SjmJGRRDLkqVQ7ujoAReMk3iNQLw49Y0abKUlGMs3eRKGI77zaQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxt08Nc6A4VawdFEaNvRdxeJPWLQDau2XCft2zJ+cLvwfKWJB0
	pcQlXEjY17QxYpKiz9aaiIVxhJC4Nz6UWU6oE0fPKLzitA6zlC54GRd/c+DgKS2kKCyb5IYKbr/
	LToTu55j18NdN3OuTKPz1tlSpcPVDY2dExpcm3mDjzkJi69rJKiMHAQTtDqRfZUwx
X-Gm-Gg: AZuq6aLTS82bC+FxleQ4qyXRF4hSXe7AVTXK1wMhPczvryicTxvAxQ9b5jfwSbU/9+s
	47WjXukgXXG5Yo8DhFKgQI0PvupjJP/mwvuRmvrNC3bR7N/CdehnJTvZW44HQBgcrDZXL9FQUWe
	y0sTyaD2BMnEeoIY6kZWy07v/rY78WDzlGEfr+Up3Jscs24B5L6/WH/eE4fcHQC/RNvGuXoyiZ9
	zsRVwtuuf6psqvYj6wyTZJkfacNDlX7a9zV90K2nZqD/gJaZfdTtwBcY+TD6pXnmv9LrqvUFpyl
	qlNE2IuEOf/WZFgY6EEPn7VzgOAM7j/D43gku5+5miC3NXjItjSDKLUhGZjFbOiJzlPiYNp9Wai
	ZpQLj6BekB5Pk6gAeWLYLF1c4F2qkes56kLOSk2FNGvLwpwY0RexxmpT04aYcbgM=
X-Received: by 2002:a17:903:298d:b0:2a7:a6b1:4f8d with SMTP id d9443c01a7336-2ab4d04cf5fmr145666365ad.40.1771306745801;
        Mon, 16 Feb 2026 21:39:05 -0800 (PST)
X-Received: by 2002:a17:903:298d:b0:2a7:a6b1:4f8d with SMTP id d9443c01a7336-2ab4d04cf5fmr145666205ad.40.1771306745310;
        Mon, 16 Feb 2026 21:39:05 -0800 (PST)
Received: from [10.152.199.53] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a743570sm90759915ad.41.2026.02.16.21.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 21:39:04 -0800 (PST)
Message-ID: <64809633-6e41-4c2a-92af-1426c5903927@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 11:09:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v3 2/2] wifi: mac80211_hwsim: Add UHR
 capabilities to the driver
To: Pablo MARTIN-GOMEZ <pmartin-gomez@freebox.fr>, johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260212180128.257565-1-karthikeyan.kathirvel@oss.qualcomm.com>
 <20260212180128.257565-3-karthikeyan.kathirvel@oss.qualcomm.com>
 <4dcf82f8-21c1-4704-8575-7f526ce1c77f@freebox.fr>
Content-Language: en-US
From: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
In-Reply-To: <4dcf82f8-21c1-4704-8575-7f526ce1c77f@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA0NCBTYWx0ZWRfX/pyk9lfmJAJV
 wCUN/jj2H8GJMur+c1s6Q2mY6+keG80pM8dHpvtaDZozOo8WDFBh5hhjPDGnDvSxstZHqyInj1j
 93m6xTNxOGDvUTfpffFZfQaiJOFOcmo0dK1shMf3C3QbVT6rTQXc/7TCSDdHs4QsnYRpbAK6RvX
 EKuPiCMwO8HzoRX/Msg/qI5XxgCJK/x7XmVVrNLU2arP77xhoftBAnU9R+3vJ/e15ru2Ol6mGgL
 Hkejh2CRKqIYr/fKDLhTn7hhREQe916UTd06M1Xn2+l0NZCj1spgYIysagbHFSfG09b/iiVIae/
 EAucqc5jaab4Q7PUugNEzegVewJXoR3hVUAcRPjeCkQLZW2FeQzxmf8W++3cLzBqP+Yp0yp8/2Z
 WtpJSTrf5DbYRr1xtjjop74SYWhPX2h1lP1fzpDey0AUnlsicwfshwb65p89etxLm1lPyKdrmRt
 pdr7ax6had/Exlcu6vA==
X-Proofpoint-ORIG-GUID: PjiPIEKBXuWkLI4UD2xtE0exT_w5JDPm
X-Proofpoint-GUID: PjiPIEKBXuWkLI4UD2xtE0exT_w5JDPm
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=6993fefa cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=3nDsj4ppMIx4tQw1i2wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_08,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_213909_991926_9F438D98 
X-CRM114-Status: GOOD (  16.07  )
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



On 2/13/2026 8:06 PM, Pablo MARTIN-GOMEZ wrote:
> Hello,
> On 12/02/2026 19:01, Karthikeyan Kathirvel wrote:
>> Add UHR capabilities for bringing up the interface in UHR mode.
>> This is required to validate UHR test cases.
>>
>> Signed-off-by: Karthikeyan Kathirvel 
>> <karthikeyan.kathirvel@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/virtual/mac80211_hwsim.c | 285 ++++++++++++++++++
>>   1 file changed, 285 insertions(+)
>>
>> diff --git a/drivers/net/wireless/virtual/mac80211_hwsim.c b/drivers/ 
>> net/wireless/virtual/mac80211_hwsim.c
>> index 4d9f5f87e814..5a576bbb7688 100644
>> --- a/drivers/net/wireless/virtual/mac80211_hwsim.c
>> +++ b/drivers/net/wireless/virtual/mac80211_hwsim.c
>> @@ -4478,6 +4478,49 @@ static const struct ieee80211_sband_iftype_data 
>> sband_capa_2ghz[] = {
>>               },
>>               /* PPE threshold information is not supported */
>>           },
>> +        .uhr_cap = {
>> +            .has_uhr = true,
>> +            .mac = {
>> +                .mac_cap[0] =
>> +                    IEEE80211_UHR_MAC_CAP0_DPS_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP0_DPS_ASSIST_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP0_DPS_AP_STATIC_HCM_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP0_NPCA_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP0_ENH_BSR_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP0_ADD_MAP_TID_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP0_EOTSP_SUPP,
>> +                .mac_cap[1] =
>> +                    IEEE80211_UHR_MAC_CAP1_DSO_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP1_PEDCA_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP1_UL_LLI_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP1_P2P_LLI_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP1_PUO_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP1_AP_PUO_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP1_DUO_SUPP,
>> +                .mac_cap[2] =
>> +                    IEEE80211_UHR_MAC_CAP2_OMC_UL_MU_DIS_RX_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP2_AOM_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP2_IFCS_LOC_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP2_UHR_TRS_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP2_TXSPG_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP2_TXOP_RET_IN_TXSPG |
>> +                    IEEE80211_UHR_MAC_CAP2_UHR_OM_PU_TO_LOW,
>> +                .mac_cap[3] =
>> +                    IEEE80211_UHR_MAC_CAP3_UHR_OM_PU_TO_HIGH |
>> +                    IEEE80211_UHR_MAC_CAP3_PARAM_UPD_ADV_NOTIF_INTV |
>> +                    IEEE80211_UHR_MAC_CAP3_UPD_IND_TIM_INTV_LOW,
>> +                .mac_cap[4] =
>> +                    IEEE80211_UHR_MAC_CAP4_UPD_IND_TIM_INTV_HIGH |
>> +                    IEEE80211_UHR_MAC_CAP4_BOUNDED_ESS |
>> +                    IEEE80211_UHR_MAC_CAP4_BTM_ASSURANCE |
>> +                    IEEE80211_UHR_MAC_CAP4_CO_BF_SUPP,
>> +            },
>> +            .phy = {
>> +                .cap =
>> +                    IEEE80211_UHR_PHY_CAP_ELR_RX |
>> +                    IEEE80211_UHR_PHY_CAP_ELR_TX,
> 
> `IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_LE80` and 
> `IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_LE80` are for 80MHz and lower, 
> it should include 20/40 MHz of 2.4 GHz, no?
> 
Will add it in next version
>> +            },
>> +        },
>>       },
>>       {
>>           .types_mask = BIT(NL80211_IFTYPE_AP) |
>> @@ -4586,6 +4629,50 @@ static const struct ieee80211_sband_iftype_data 
>> sband_capa_2ghz[] = {
>>               },
>>               /* PPE threshold information is not supported */
>>           },
>> +        .uhr_cap = {
>> +            .has_uhr = true,
>> +            .mac = {
>> +                .mac_cap[0] =
>> +                    IEEE80211_UHR_MAC_CAP0_DPS_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP0_DPS_ASSIST_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP0_DPS_AP_STATIC_HCM_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP0_NPCA_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP0_ENH_BSR_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP0_ADD_MAP_TID_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP0_EOTSP_SUPP,
>> +                .mac_cap[1] =
>> +                    IEEE80211_UHR_MAC_CAP1_DSO_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP1_PEDCA_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP1_DBE_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP1_UL_LLI_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP1_P2P_LLI_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP1_PUO_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP1_AP_PUO_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP1_DUO_SUPP,
>> +                .mac_cap[2] =
>> +                    IEEE80211_UHR_MAC_CAP2_OMC_UL_MU_DIS_RX_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP2_AOM_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP2_IFCS_LOC_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP2_UHR_TRS_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP2_TXSPG_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP2_TXOP_RET_IN_TXSPG |
>> +                    IEEE80211_UHR_MAC_CAP2_UHR_OM_PU_TO_LOW,
>> +                .mac_cap[3] =
>> +                    IEEE80211_UHR_MAC_CAP3_UHR_OM_PU_TO_HIGH |
>> +                    IEEE80211_UHR_MAC_CAP3_PARAM_UPD_ADV_NOTIF_INTV |
>> +                    IEEE80211_UHR_MAC_CAP3_UPD_IND_TIM_INTV_LOW,
>> +                .mac_cap[4] =
>> +                    IEEE80211_UHR_MAC_CAP4_UPD_IND_TIM_INTV_HIGH |
>> +                    IEEE80211_UHR_MAC_CAP4_BOUNDED_ESS |
>> +                    IEEE80211_UHR_MAC_CAP4_BTM_ASSURANCE |
>> +                    IEEE80211_UHR_MAC_CAP4_CO_BF_SUPP,
>> +            },
>> +            .phy = {
>> +                .cap =
>> +                    IEEE80211_UHR_PHY_CAP_ELR_RX |
>> +                    IEEE80211_UHR_PHY_CAP_ELR_TX,
> Same
Will add it in next version
>> +            },
>> +        },
>>       },
>>   #ifdef CONFIG_MAC80211_MESH
>>       {
>> @@ -4755,6 +4842,55 @@ static const struct ieee80211_sband_iftype_data 
>> sband_capa_5ghz[] = {
>>               },
>>               /* PPE threshold information is not supported */
>>           },
>> +        .uhr_cap = {
>> +            .has_uhr = true,
>> +            .mac = {
>> +                .mac_cap[0] =
>> +                    IEEE80211_UHR_MAC_CAP0_DPS_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP0_DPS_ASSIST_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP0_DPS_AP_STATIC_HCM_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP0_NPCA_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP0_ENH_BSR_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP0_ADD_MAP_TID_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP0_EOTSP_SUPP,
>> +                .mac_cap[1] =
>> +                    IEEE80211_UHR_MAC_CAP1_DSO_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP1_PEDCA_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP1_UL_LLI_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP1_P2P_LLI_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP1_PUO_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP1_AP_PUO_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP1_DUO_SUPP,
>> +                .mac_cap[2] =
>> +                    IEEE80211_UHR_MAC_CAP2_OMC_UL_MU_DIS_RX_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP2_AOM_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP2_IFCS_LOC_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP2_UHR_TRS_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP2_TXSPG_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP2_TXOP_RET_IN_TXSPG |
>> +                    IEEE80211_UHR_MAC_CAP2_UHR_OM_PU_TO_LOW,
>> +                .mac_cap[3] =
>> +                    IEEE80211_UHR_MAC_CAP3_UHR_OM_PU_TO_HIGH |
>> +                    IEEE80211_UHR_MAC_CAP3_PARAM_UPD_ADV_NOTIF_INTV |
>> +                    IEEE80211_UHR_MAC_CAP3_UPD_IND_TIM_INTV_LOW,
>> +                .mac_cap[4] =
>> +                    IEEE80211_UHR_MAC_CAP4_UPD_IND_TIM_INTV_HIGH |
>> +                    IEEE80211_UHR_MAC_CAP4_BOUNDED_ESS |
>> +                    IEEE80211_UHR_MAC_CAP4_BTM_ASSURANCE |
>> +                    IEEE80211_UHR_MAC_CAP4_CO_BF_SUPP,
>> +            },
>> +            .phy = {
>> +                .cap =
>> +                    IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_LE80 |
>> +                    IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_LE80 |
>> +                    IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_160 |
>> +                    IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_160 |
>> +                    IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_320 |
>> +                    IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_320 |
> I'm not aware of an operating class that allows 320 MHz on 5 GHz (or 
> even a non standard use of it), 
> `IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_320` and 
> `IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_320` should be dropped
Agree, will remove it
>> +                    IEEE80211_UHR_PHY_CAP_ELR_RX |
>> +                    IEEE80211_UHR_PHY_CAP_ELR_TX,
>> +            },
>> +        },
>>       },
>>       {
>>           .types_mask = BIT(NL80211_IFTYPE_AP) |
>> @@ -4880,6 +5016,56 @@ static const struct ieee80211_sband_iftype_data 
>> sband_capa_5ghz[] = {
>>               },
>>               /* PPE threshold information is not supported */
>>           },
>> +        .uhr_cap = {
>> +            .has_uhr = true,
>> +            .mac = {
>> +                .mac_cap[0] =
>> +                    IEEE80211_UHR_MAC_CAP0_DPS_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP0_DPS_ASSIST_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP0_DPS_AP_STATIC_HCM_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP0_NPCA_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP0_ENH_BSR_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP0_ADD_MAP_TID_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP0_EOTSP_SUPP,
>> +                .mac_cap[1] =
>> +                    IEEE80211_UHR_MAC_CAP1_DSO_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP1_PEDCA_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP1_DBE_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP1_UL_LLI_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP1_P2P_LLI_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP1_PUO_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP1_AP_PUO_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP1_DUO_SUPP,
>> +                .mac_cap[2] =
>> +                    IEEE80211_UHR_MAC_CAP2_OMC_UL_MU_DIS_RX_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP2_AOM_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP2_IFCS_LOC_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP2_UHR_TRS_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP2_TXSPG_SUPP |
>> +                    IEEE80211_UHR_MAC_CAP2_TXOP_RET_IN_TXSPG |
>> +                    IEEE80211_UHR_MAC_CAP2_UHR_OM_PU_TO_LOW,
>> +                .mac_cap[3] =
>> +                    IEEE80211_UHR_MAC_CAP3_UHR_OM_PU_TO_HIGH |
>> +                    IEEE80211_UHR_MAC_CAP3_PARAM_UPD_ADV_NOTIF_INTV |
>> +                    IEEE80211_UHR_MAC_CAP3_UPD_IND_TIM_INTV_LOW,
>> +                .mac_cap[4] =
>> +                    IEEE80211_UHR_MAC_CAP4_UPD_IND_TIM_INTV_HIGH |
>> +                    IEEE80211_UHR_MAC_CAP4_BOUNDED_ESS |
>> +                    IEEE80211_UHR_MAC_CAP4_BTM_ASSURANCE |
>> +                    IEEE80211_UHR_MAC_CAP4_CO_BF_SUPP,
>> +            },
>> +            .phy = {
>> +                .cap =
>> +                    IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_LE80 |
>> +                    IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_LE80 |
>> +                    IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_160 |
>> +                    IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_160 |
>> +                    IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_SND_NDP_320 |
>> +                    IEEE80211_UHR_PHY_CAP_MAX_NSS_RX_DL_MU_320 |
> 
> Same
> 
Done
> [...]
> 
> Best regards,
> 
> Pablo MG
> 


