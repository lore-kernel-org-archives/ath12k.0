Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1854C761AF
	for <ath12k@archiver.kernel.org>; Mon,  3 Apr 2023 14:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4GFQdB3aBy4yi9bx224pZzdyTRsay4zmrjqpex71wIY=; b=cQL3dzEhkw52bU
	VSzCxaBIBAZaGgkdqub6TEEVCq2GYzLHEss7yoktgfFmLd/SPMfEx/8vhYuX/zZ3PqTTmbRBdTVML
	VR+/UNQTiMqNMIvByremruXmbAZfp75SQcUn4JJspHL467UtRXpYaPeuiaY6Z+LBEPQj7QqvJ6bNM
	C7z/V2pUdTOnGdSGSXfDi3iE+xv9az2C/cBT8Qi4pVeMuQEnesKJzKT75gl6SmHqvuFDA4qtt7ydi
	c/C9X16O44TW5ZU5tLWYYbDtj48q1Rj2MN2J5pPl+Ct2Snku9IqKErGST2oHf3WUrNnDCeohyQQ7u
	CR6KCElqJyeBgLWNLG3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjL3m-00FcoI-1u
	for ath12k@archiver.kernel.org;
	Mon, 03 Apr 2023 14:21:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjL3g-00Fcla-30;
	Mon, 03 Apr 2023 14:21:24 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 333Ailk9008610;
	Mon, 3 Apr 2023 14:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=TvJL6iO21505iTIUgNDYxI7ABKfy17PjIQZA4KoMYyE=;
 b=Qmo3Yp6oQZkZBQRCLyMc5dLzGHdbwfMXKs+9geaEbuzJoJcDOc1Wu+q67RsIMCdaT3iO
 t1+KDfn4RjIv+IKUdW3SmeKEXsJmUVMcFIsFZEohW0zTZw3GpnzpW26wVLFlbGYrOmI6
 ACBr6obLMMdrGJ8F1cpee0aRNEfkw4pffklWBPL3P/h0GA3GqzgBVE19gMZhokbe03OD
 MVVO+A5PlSJZQqGH0E4qHCDJAJSdgY5dOX3OlOy1OH44NbAMrYJhGtuJk1oZ/r54C/eh
 eNmUs5OoMGJN+6IuSGxWSepUe7Zh5Em9AaUnTPOux9+o/s/N8X1BswSiMBOBhN1bfFYX AQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pqus58qv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Apr 2023 14:21:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 333ELGN1007229
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Apr 2023 14:21:17 GMT
Received: from [10.253.35.21] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 3 Apr 2023
 07:21:15 -0700
Message-ID: <955cf0b5-8973-86b5-109e-268917d70904@quicinc.com>
Date: Mon, 3 Apr 2023 22:21:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 24/27] wifi: mac80211: implement link switching
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        <linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>, <ath12k@lists.infradead.org>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
 <20220902161143.d99dfbe65c90.I92385ba882ec984a9a2ad18293173436657e82aa@changeid>
 <ca5177fe-3b9f-2309-9afd-1d5e827540f7@quicinc.com>
 <50719d34bc48d816d00b56d3d9efdb59e3e51a16.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <50719d34bc48d816d00b56d3d9efdb59e3e51a16.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5uPBzRF3q1L1YZnYW10xnH9_gQex2MYP
X-Proofpoint-GUID: 5uPBzRF3q1L1YZnYW10xnH9_gQex2MYP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_11,2023-04-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=539
 adultscore=0 impostorscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304030104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_072121_092655_6E18368C 
X-CRM114-Status: GOOD (  14.03  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 3/27/2023 4:31 PM, Johannes Berg wrote:
> Hi,
>
>>> +	list_for_each_entry(sta, &local->sta_list, list) {
>>> +		if (sdata != sta->sdata)
>>> +			continue;
>>> +		ret = drv_change_sta_links(local, sdata, &sta->sta,
>>> +					   old_active,
>>> +					   old_active | active_links);
>>> +		WARN_ON_ONCE(ret);
>>> +	}
>>> +
>>> +	ret = ieee80211_key_switch_links(sdata, rem, add);
>> I see ieee80211_key_switch_link() only handler the per-link(link_id >=
>> 0) keys,
>>
>> So I think lower driver also install the pairwise keys(link_id = -1) for
>> the added links at this moment?
> Well from mac80211 POV they're already installed, so we can't really
> install them again. We'd have to remove them but that's racy, obviously.
> So I think the low-level driver just has to handle that, e.g. when the
> station links are updated (and the key belongs to the station.)
>
>
Thanks Johannes,

Also it does not have BSS_CHANGED_ASSOC(exists in 
ieee80211_set_associated()) for

ieee80211_link_info_change_notify()/ieee80211_vif_cfg_change_notify().

So I think low-level driver also need to auto add BSS_CHANGED_ASSOC 
logic for the added link as well as the pairwise key you said, right?



-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
