Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721DCCD1288
	for <ath12k@archiver.kernel.org>; Wed,  3 Apr 2024 06:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHqopKFcq2IQz4qCDQC4kx5e6ZifsY/PwTBJauqEql0=; b=WeqQiQX62m+vgeWKabXE3Vzxk7
	LknT5GTxvRfxaqHyEJcNVJGej6+djuL3iJdUDYeQ5HVg+jgwdgQS4ZLc7GQV1KfvYjn4AL+jNOiEE
	510RjZXB6UfkBlalHaRHZg4Umj+dDJfNYrGxdKMTaanNm7/kM/jhJeoqd78kSmGSYEXIT2+ES2Q+a
	9+qUpnHZ4YVgHFC9/N7qizWyKnRL2fBLqzODM+M46EBCYc6f9P1BkBMPvc/kGBgho6JQWheKUzFTl
	5LzmO1eK4d877lsiPl3wwueeUpwr4MTa0AZ8VuSnmzyRetEaIp7DvvHhG91z2Qs99G7auMLJxyyWX
	cJkVjD8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rruNn-0000000EJBY-0b3t
	for ath12k@archiver.kernel.org;
	Wed, 03 Apr 2024 06:46:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rruNj-0000000EJAc-2u97
	for ath12k@lists.infradead.org;
	Wed, 03 Apr 2024 06:46:01 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4336B1fK019976;
	Wed, 3 Apr 2024 06:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:from:to:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=aHqopKFcq2IQz4qCDQC4kx5e6ZifsY/PwTBJauqEql0=; b=P1
	n7VxqzMuZfD3UOVFlbEBfamrYAya/yubJNGiM7DcAa1htsZXnosSUc+KKcirdvvr
	Rp+6nzciUwGUPy51fDvJ0OxVsVFR+QegA3I32BhGitakZClnvRMpQt8EaFAW08ZV
	jihetH3964HyXZFpDzl8+fg6wRXq0BgLUGf2fQnzLyTFqX4r/sexWhPldK/BxV5R
	fxE7gbdJ1KJAqah9ymkITsQIQUbrTITJycuwJPGpxxdDjNTWLm2uNArM6hijikf+
	w/+gmlU0rDN3zE6WAYC+zoBf0R62sosEiqsndGu1DYGiMMXJh/ap/hJZwpGc+5A5
	fmYDLJ7EoQAsIpe4K3QQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x8ny5hd9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Apr 2024 06:45:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4336jt3q012092
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Apr 2024 06:45:55 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 2 Apr 2024
 23:45:54 -0700
Message-ID: <adf6e7df-11c7-4692-ab8d-d53eb5675045@quicinc.com>
Date: Wed, 3 Apr 2024 14:45:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WCN7850 disconnects and reconnects in a loop
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: Gregoire <gregoire.s93@live.fr>, <ath12k@lists.infradead.org>
References: <AS8P190MB12051DDBD84CD88E71C40AD7873F2@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
 <ac861ea8-5a75-4654-8ab1-05ac0c4846e9@quicinc.com>
Content-Language: en-US
In-Reply-To: <ac861ea8-5a75-4654-8ab1-05ac0c4846e9@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5sx4mVmJpt09zs1rpgAiT2Aj9etXqOVr
X-Proofpoint-ORIG-GUID: 5sx4mVmJpt09zs1rpgAiT2Aj9etXqOVr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_05,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 mlxlogscore=606 clxscore=1015
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2404030043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_234559_876194_ED073DE2 
X-CRM114-Status: GOOD (  13.33  )
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



On 4/3/2024 2:36 PM, Baochen Qiang wrote:
> 
> 
> On 4/1/2024 5:56 PM, Gregoire wrote:
>> Hello,
>>
>> I have a QCNCM865 card with a WCN7850 chipset. I'm running Arch Linux 
>> version 6.9.0-rc2-1-mainline.
>>
>> I'm experiencing difficulty connecting to any Wi-Fi network; the 
>> device connects and reconnects almost immediately.
>>
>> Here's a gist containing some logs from dmesg and journalctl related 
>> to iwd.
>>
>> https://gist.github.com/GreyXor/5e6dc8e610a00c8aab37a1251d36dbc1
> 
> The log below seems strange. Actually we have a patch to fix this issue
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/drivers/net/wireless/ath/ath12k?id=a49732b1f1f8128608b1192c562880dd29037c06. So the question is are you still seeing this log with latest Kalle's ath.git?
> 
> [ 1132.255250] ath12k_pci 0000:01:00.0: Unknown htt tx status 8
> 
> Current logs don't provide enough info.  Could you reproduce it with 
> full ath12k log and IWD log enabled and share them to us?
> For ath12k, first unload module and then reload.
>      modprobe -r ath12k
>      modprobe ath12k dyndbg=+pflmt debug_mask=0xffffffff
> For IWD, simply add '-d' option when starting it. You may directly add 
> it to the systemd service entry if you like. See 
> https://iwd.wiki.kernel.org/debugging
> 
> Better if you could also capture air sniffer as well.
> 
And please share complete kernel/dmesg and IWD log, not need to do grep.

>>
>> Let me know if you need anything else for debugging
>>
>> I also tried 
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git last 
>> week on master, and same problem
>>
>> Thanks
>>
>>
> 

