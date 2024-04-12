Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7F4C4345F
	for <ath12k@archiver.kernel.org>; Fri, 12 Apr 2024 03:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1r/E0101GQWKHBcIZz1azRURcntQtHEWDtn2SyCVTw4=; b=Y7dCjsvZ97D17PuGIJHyl8rI/K
	p7gvhMcUgAcus+6vSiMZKpU3Nhy8BvE4lAT+ccgCTay4ij6Yt572JUSYbb4PHUzDpP463xRqkaPh8
	DmPEU/h21VebxuvPNRpwXg4JeFkpWVMAYdzB1MF4bCnMu57aXwEoQVGqc9vYm/ICt+EL/8eAmlkQM
	oGMNc1RUDFcBjUVcV5koesrSWR4+N24tApl1OXepXsn4v5m9MPxxC36GBnl7QzD6ApqPcDUldEwi0
	nskpzD/ueT+02ioF2xfZWS9jJn9VsNyqNl7KIQ2vkqrxySOWNrJpYNbFgD7cIWLEz4vaQnGTzxv04
	+rxZw9QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv7wa-0000000F7V4-23JF
	for ath12k@archiver.kernel.org;
	Fri, 12 Apr 2024 03:51:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv7wX-0000000F7UN-1u6V
	for ath12k@lists.infradead.org;
	Fri, 12 Apr 2024 03:51:14 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43C2k2WO011223;
	Fri, 12 Apr 2024 03:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=1r/E0101GQWKHBcIZz1azRURcntQtHEWDtn2SyCVTw4=; b=Lz
	LhBMr0voHCQrFhE+t1lYPhf2M34S/JQYAIIv/WqJAZn3WH8XzSoEEZ1FmIVIkG1C
	WYmvNuTtyrv75LrdV/Itttmqkbf+ADcDllMrFWWKCoRWvf9aRIfYGjzk77IwC3vw
	CXUbwQK/IrMzDXuA5WKcgtc+/MvQ8yykH3P38znGe3wmo7V921ksNSlA+Ya2W+jW
	yWJDM1dCoa9mkalUs/jwi/Xq8R9q7cvvCeCM46BwS1Tygrl9PgvadC1yDkO8le91
	Ivye5/tz1UAh2KdQNtjrvS7IOaHKa0U6rjuTiNmFYr6INjyz89uPNVS5bpWi753v
	QQeWokevclRt6tMIcE0w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xeskt0cy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 03:51:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43C3p3f9002745
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 03:51:03 GMT
Received: from [10.216.26.110] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Apr
 2024 20:50:59 -0700
Message-ID: <6ff353e2-785a-f2ce-8d3b-acc8e79a64cf@quicinc.com>
Date: Fri, 12 Apr 2024 09:20:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 01/13] wifi: cfg80211: Add provision to advertise multiple
 radio in one wiphy
Content-Language: en-US
To: <mbizon@freebox.fr>, Jeff Johnson <quic_jjohnson@quicinc.com>,
        Ben Greear
	<greearb@candelatech.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
 <20240328072916.1164195-2-quic_periyasa@quicinc.com>
 <e36599d3269496de59505b36be46f873976f8706.camel@sipsolutions.net>
 <033185b0-f878-a50b-d0d9-57fa79439bdf@quicinc.com>
 <ef6b6a7a4a9d3b01c0eb6abf0991e7e27425e102.camel@sipsolutions.net>
 <80fe5786-f764-455d-ac44-22adf7aeaf94@candelatech.com>
 <31f30c0e318904f3a082c7f213576ceb1f407141.camel@sipsolutions.net>
 <20b56e52-a5e2-70cd-a62a-8c4a3526c2cf@candelatech.com>
 <614bb8a8f1d9174ad7d87cf7636f657cda7b1ef9.camel@sipsolutions.net>
 <aa9e1d54-bb5f-37cc-335f-c9970ab13789@candelatech.com>
 <0cfe990b-182b-4ceb-b5b4-2989fefedb2f@quicinc.com>
 <29f7ecb6d7c208c3614f37616943d5f97bb134d3.camel@freebox.fr>
 <5fc2f2d2-7403-79d2-8909-ddda918ff8d5@quicinc.com>
 <af70ee81e583f58dada3dde87ac335137c4038b0.camel@freebox.fr>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <af70ee81e583f58dada3dde87ac335137c4038b0.camel@freebox.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qUwxcKRjabywxA8BngawRbqn-uuaeM0T
X-Proofpoint-ORIG-GUID: qUwxcKRjabywxA8BngawRbqn-uuaeM0T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_14,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 mlxlogscore=628 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404120026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_205113_544188_DC2CB2AA 
X-CRM114-Status: GOOD (  15.77  )
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



On 4/11/2024 10:09 PM, Maxime Bizon wrote:
> 
> On Thu, 2024-04-11 at 21:56 +0530, Vasanthakumar Thiagarajan wrote:
> 
> Hello,
> 
> Thanks for making it clear,
> 
> 
>>> For example, starting a 5Ghz AP in ax-only mode, and at the same
>>> time
>>> creating a STA interface on 2.4GHz ?
> 
>> Yes, such use cases continue to be supported in single wiphy mode.
> 
> Understood, but I see some corner cases.
> 
> 
> For example, assume two bands AP hardware, 2.4GHz and 5GHz.
> 
> Previously:
>    - phy0 is 2.4Ghz
>    - phy1 is 5Ghz
>    - iw phy phy0 interface create wlan0 type managed
>    - iw dev wlan0 scan
> 
> => will only scan 2.4Ghz
> 
> 
> With single phy approach:
>    - phy0 is 2.4Ghz + 5Ghz concurrent
>    - # iw phy phy0 interface create wlan0 type managed
>    - # iw dev wlan0 scan
> 
> => will scan both bands ?
> 

Yes, both the bands will be scanned if freq list is not given

>    - <starting from previous state>
>    - # iw phy phy0 interface create wlan1 type __ap
>    - # hostapd -i wlan1 <config>
>    - # iw dev wlan0 scan
> 
> => what will happen then ?
>

Scan will be carried out on all the radios including the one on which AP interface is 
running. Scan with freq list can be used not to disturb the radio of AP interface.

> > Same goes for hostapd ACS, I assume specifying freqlist becomes
> mandatory or we can't predict which band the AP will be on ?
> 

If no freq list is given, ACS will run through all the bands and select a channel from any 
of the bands. But this can be optimized to do ACS and channels selection on a particular 
band using channellist/freqlist hostapd configurations.

Vasanth

