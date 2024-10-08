Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A537CED268
	for <ath12k@archiver.kernel.org>; Tue,  8 Oct 2024 05:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wD7zD8w10mP+ohQu4eNgrzKSlFKA0Lx5UXkzDpOElak=; b=iIkgGo9A0aYX5Tqas0BcFF1CPR
	NQ0Ptu8Pd4PecNFlgCTH5fwSBW+yGT+7e0+csRoGG2d3Bz126HH0IOotG5r558M07lvPNKqwrzDDC
	mGU9kU9Z1UnR6jUQJTAFTv+f3bAmpCM/Vc5uaTcbD/rSuEVLWfsqpp04JEsEB3zQQ0W8ntlZStLJ+
	HlgIAtbCYg6tOykGIOVyTAQwiRsYJpX3BxfGgamHxNw8iRXcDrFrvAU5Cp6wU6gBxZ8v8j2T2FZP7
	Z34JDFnCPbK2ctN5TXBAlJdmVBe+L91Sky2jPoVnYqMdAQ66WY+iMipleMDrY23SRrhqJfhOWKEUU
	ZkGuzW3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy2Xr-00000004X88-3gRn
	for ath12k@archiver.kernel.org;
	Tue, 08 Oct 2024 05:14:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy2Xo-00000004X7k-3P6l
	for ath12k@lists.infradead.org;
	Tue, 08 Oct 2024 05:14:02 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4984SZBA008688;
	Tue, 8 Oct 2024 05:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wD7zD8w10mP+ohQu4eNgrzKSlFKA0Lx5UXkzDpOElak=; b=KHWGd3SLQvR6WrDe
	UCXCExlvmmO+FvAOerj2VJ4YeG4Zstl00Wjkgv3crOlvyeGx/cU+5aQGE+VdvYlq
	vXGjj07rc2XBr/meDAFP1e/lVUBRzsT24fmJMaqGcABmksAl5GCDqkz5ioukXwMR
	adbZFA8j1jKiful7+HjicACUPOmuB1PtaGTbqS4G+98dI56AY2ViOPnjXn03lQKN
	s+pVU5mi+sWGezLjkLCkMFCNjfOIQIFl/Br9mKjHilq9VIXCbungMlyDptbFNBis
	UrWJq5I4HsHN/qfRggSKEvkjgKwje7P/ztq3EgRdOMav09171FKstgwBHym+j0kE
	mLhmzw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424wrc02pt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 05:13:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4985DwhX026392
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Oct 2024 05:13:58 GMT
Received: from [10.152.202.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Oct 2024
 22:13:56 -0700
Message-ID: <97054998-0793-4c71-a202-dd5167fcc24d@quicinc.com>
Date: Tue, 8 Oct 2024 10:43:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: mac80211: re-order assigning channel in activate
 links
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
To: Johannes Berg <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>
References: <20241001085034.2745669-1-quic_adisi@quicinc.com>
 <93df47a867ee1f8d84cabdbc953707eab2ea3704.camel@sipsolutions.net>
 <6504caf7-e9d5-49ff-983e-73335f8ee3a1@quicinc.com>
Content-Language: en-US
In-Reply-To: <6504caf7-e9d5-49ff-983e-73335f8ee3a1@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DvIQ7wmkr1Xeun-pdkoLMdcUppB3sF4o
X-Proofpoint-ORIG-GUID: DvIQ7wmkr1Xeun-pdkoLMdcUppB3sF4o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_221400_904089_3BEE69C4 
X-CRM114-Status: GOOD (  15.59  )
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

On 10/1/24 15:49, Aditya Kumar Singh wrote:
> On 10/1/24 15:29, Johannes Berg wrote:
>> On Tue, 2024-10-01 at 14:20 +0530, Aditya Kumar Singh wrote:
...
>>
>> which sort of indicates that we're working around it, but it also
>> correctly says that we cannot activate a link before we have the (link)
>> station.
>>
>> In the flow as you changed it we'd activate the link in firmware before
>> the stations are added, but that isn't allowed. There's not really a
> 
> Is this a generic expectation? And that too only for ML STA? Since at 
> least for ML AP, we could have links in firmware active and later when 
> station connects, we create link stations.
> 
>> good place to hook into after the station is added, unless we somehow
>> want to activate the link from the station change, but that seems ...
>> odd to say the least? Though I guess it's already somewhat odd to init
>> rate control here as written now...
>>
>> Maybe we can hook into the later link info change. This seems to
>> initially work, but still doing more tests:
>>
> 
> sure, hoping that it passes all ;)
> 

Hi Johannes,

Is your testing complete? Do you see any issues with this change?

-- 
Aditya


