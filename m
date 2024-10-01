Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED4BCE7D0B
	for <ath12k@archiver.kernel.org>; Tue,  1 Oct 2024 10:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GysN16ZrVCbTXlibSYQpK3+5Q7D+Y4qUkimj6BuQZQ0=; b=BIncRG+abTx3DyRFVNuedFsaNE
	GSaWXuMtTj9Ta5dAMCjJJ34LxAjYP4Q7Pn8dxAjqvOG/pzHH0J1NWt95z34Zd3Awmw3/Zqu/W3+el
	M8CzMNf8Gmw586X/yGs0plSJNHRmmlmSpR3a0X7drt2hokVQ8N+PkILevkgYgRjruuoYg+GqaOYrd
	HqrOA5wbhEiffGmYrZ+q2CXYd5742C/Au9aMifl/6kBLGCgk+fVSkEJ8kUA4KDcfQGM2A750B0m+G
	ME+2ZZQ2AgBBVvD89T70aqHi+YIfB6zszaz/G2AKPPQbPFli7fnxAYQw6bxMRAeFY1qcvm1PTCIDX
	qhZqH/Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svZzU-00000002KZT-1jqn
	for ath12k@archiver.kernel.org;
	Tue, 01 Oct 2024 10:20:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svZyT-00000002KVV-2i5E
	for ath12k@lists.infradead.org;
	Tue, 01 Oct 2024 10:19:23 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4910xvvW007005;
	Tue, 1 Oct 2024 10:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GysN16ZrVCbTXlibSYQpK3+5Q7D+Y4qUkimj6BuQZQ0=; b=aFjxoIq2UM8x7E0M
	x4sIPNZRIpo1N7EekhYSurlHh+iSJ7boIMDZ5WRXDjj5OCVHS6zFho6PnWnrnwoi
	2RIFxnl/Ke0XMgmOmoUdmYCC6PquqCU9YJvbmX2lMEtmvO/Rl6pdgfa8fCb5k/UJ
	bnCdIe6UXUAsgbD1pJ8DMt7Wf9Z84yBkvvD6T/qINShoGWZGeCAnqGL5hSB9CxjZ
	wfcCzeOV/+TNEGwkbwEN09Dv2ctvm1QZI0Vqgb9+aJQLtw6F/syX01rUZtajynG3
	lKhVI9WbYKC/EhVnLRhncajKR3gSM1WGvnY2hoktJT+9e4Tx/2W61BmgTyJ/HeEO
	ts6QRw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x9vu7v0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 10:19:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 491AJIlk019627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Oct 2024 10:19:18 GMT
Received: from [10.152.202.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 1 Oct 2024
 03:19:17 -0700
Message-ID: <6504caf7-e9d5-49ff-983e-73335f8ee3a1@quicinc.com>
Date: Tue, 1 Oct 2024 15:49:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: mac80211: re-order assigning channel in activate
 links
To: Johannes Berg <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>
References: <20241001085034.2745669-1-quic_adisi@quicinc.com>
 <93df47a867ee1f8d84cabdbc953707eab2ea3704.camel@sipsolutions.net>
Content-Language: en-US
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <93df47a867ee1f8d84cabdbc953707eab2ea3704.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wR3G7j3XeXT6qn8MSO-4iewg5H2RlxH1
X-Proofpoint-ORIG-GUID: wR3G7j3XeXT6qn8MSO-4iewg5H2RlxH1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2410010066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_031921_849402_4B1EAC93 
X-CRM114-Status: GOOD (  25.80  )
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

On 10/1/24 15:29, Johannes Berg wrote:
> On Tue, 2024-10-01 at 14:20 +0530, Aditya Kumar Singh wrote:
>> The current flow in _ieee80211_set_active_links() does not align with the
>> operational requirements of drivers that groups multiple hardware
>> under a single wiphy. These drivers (e.g ath12k) rely on channel
>> assignment to determine the appropriate hardware for each link. Without
>> this, the drivers cannot correctly establish the link interface.
>>
>> Currently in _ieee80211_set_active_links(), after calling
>> drv_change_vif_links() on the driver, the state of all connected stations
>> is updated via drv_change_sta_links(). This is followed by handling keys
>> in the links, and finally, assigning the channel to the links.
>> Consequently, drv_change_sta_links() prompts drivers to create the station
>> entry at their level and within their firmware. However, since channels
>> have not yet been assigned to links at this stage, drivers have not
>> created the necessary link interface for establishing link stations,
>> leading to failures in activating the links.
>>
>> Therefore, re-order the logic so that after drv_change_vif_links() and
>> removing the old links, channels are assigned to newly added links.
>> Following this, the flow proceeds to station handling.
>>
> 
> I tried this again but I fear it fundamentally cannot work with iwlwifi.
> 
> We have this comment:
> 
>          /* Initialize rate control for the AP station, since we might be
>           * doing a link switch here - we cannot initialize it before since
>           * this needs the phy context assigned (and in FW?), and we cannot
>           * do it later because it needs to be initialized as soon as we're
>           * able to TX on the link, i.e. when active.
>           */
> 
> which sort of indicates that we're working around it, but it also
> correctly says that we cannot activate a link before we have the (link)
> station.
> 
> In the flow as you changed it we'd activate the link in firmware before
> the stations are added, but that isn't allowed. There's not really a

Is this a generic expectation? And that too only for ML STA? Since at 
least for ML AP, we could have links in firmware active and later when 
station connects, we create link stations.

> good place to hook into after the station is added, unless we somehow
> want to activate the link from the station change, but that seems ...
> odd to say the least? Though I guess it's already somewhat odd to init
> rate control here as written now...
> 
> Maybe we can hook into the later link info change. This seems to
> initially work, but still doing more tests:
> 

sure, hoping that it passes all ;)

-- 
Aditya


