Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0720C27C7A
	for <ath12k@archiver.kernel.org>; Thu, 17 Aug 2023 11:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9VsjVH3fGz/Jky2j5oFIkh49aUM/oHRCmO2lHl60/Jg=; b=3do32XiBzjhKan
	MdIavtfrveWXmscD5CkGYQxzzatnX/cmOexM7vcxR/zD75aywMvTQHwxIvMNghbjYXJBCcJx1/au/
	oeTrYwVVu+9xFp8zjNR7VWZZ2mzrWLImTykNgc+YzvELgp69pI1EsAVcr8elaPTu4ZRAZvDlP17Wx
	D+Wfm4cgpZnqKGc28MzO2+GtgedlFl0weAvQ8aXiat/GgQzIT5kXMbtN0xt1mmNHAKVWK3TYbRyey
	wRVnKwFkZ0S6Kd35e+GLqzufS+d3ccF03wflXGFzTntio3VRfLtRu9ZzFzsSBMxwUCmfBtPV4Wv0j
	x5bB04panlRfvY0xtOoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWb2m-006FqG-18
	for ath12k@archiver.kernel.org;
	Thu, 17 Aug 2023 11:20:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWb2j-006FpG-0c
	for ath12k@lists.infradead.org;
	Thu, 17 Aug 2023 11:19:58 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37H6cjMx026030;
	Thu, 17 Aug 2023 11:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=SK7j2M0Db6YTZvZ0j6QJ6HhlAUzA+QZB8EXikkrit9Q=;
 b=B6hkafeMxJViTyosHAQLjnHMqH973DSltc6g+PcyMkoOIGP3HcgaKp81E40ncr9Ub7Bs
 DtYvn+CKk9BpRbkYVLsRQz7ocDSItLNbWujXIRF4YsOTy9WNuKAfXBNBeNLzznhA3oJ5
 7RZ0rReetmp0DmyYFHfqDXvB+VRaI9wE9f6nwJqE+U/Eyw5xW+QwTvf73dFxqqHzoaI7
 Qsxrv0KMJGzvtNFTgjlYxt/VY71Dustw5TPCLKktbp+yQuDNsm2Qo+svKKGD9WhrpFOP
 wuUv7nZ7a3ZWKLRBK7OKpgZg5laq7E8su5P4G6gGVFTEBfiTq6VDfhwWhRjUZJW2XkPF 7w== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sh3xx9njh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 11:19:52 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37HBJpx5015504
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 11:19:51 GMT
Received: from [10.201.204.39] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 17 Aug
 2023 04:19:49 -0700
Message-ID: <7297c2ba-64d8-c403-6d3a-7b0f20f64c6a@quicinc.com>
Date: Thu, 17 Aug 2023 16:49:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: fix WARN_ON during
 ath12k_mac_update_vif_chan
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230802085852.19821-1-quic_mdharane@quicinc.com>
 <20230802085852.19821-2-quic_mdharane@quicinc.com>
 <54733de9-db66-f1c4-9ad5-4d1f31529c05@quicinc.com>
 <40034bde-5512-8df5-a19d-48487102c003@quicinc.com>
From: Manish Dharanenthiran <quic_mdharane@quicinc.com>
In-Reply-To: <40034bde-5512-8df5-a19d-48487102c003@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MD5JXbNnyBOEhNtdHPEr7uwR-lZi1_hA
X-Proofpoint-ORIG-GUID: MD5JXbNnyBOEhNtdHPEr7uwR-lZi1_hA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-17_03,2023-08-17_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 bulkscore=0 mlxlogscore=670 clxscore=1015 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308170102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_041957_269984_005D2F21 
X-CRM114-Status: GOOD (  16.82  )
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


On 8/8/2023 3:56 PM, Wen Gong wrote:
> On 8/2/2023 10:59 PM, Jeff Johnson wrote:
>> On 8/2/2023 1:58 AM, Manish Dharanenthiran wrote:
>>> Fix WARN_ON() from ath12k_mac_update_vif_chan() if vdev is not up.
>>> Since change_chanctx can be called even before vdev_up.
>>>
>>> Do vdev stop followed by a vdev start in case of vdev is down.
>>>
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0-02903-QCAHKSWPL_SILICONZ-1
>>
>> Has this been tested on WCN7850? My understanding is that firmware may 
>> expect vdev down and then vdev restart
>>
> For WCN7850, firmware do not expect vdev down for station vdev type here.
> 
> And this patch only take effect when arvif->is_up is not set,
> 
> it is hard to happen that for MCC station mode.
> 
> Because this function is entered for channel switch for MCC station mode,
> 
> it means station is connected to the AP, then arvif->is_up is set, then 
> this patch not take effect.
> 
> [...]
> 
>>
Thanks Wen for checking this change!

Hi Jeff,

Kindly review the changes and provide your comments.

Regards
Manish Dharanenthiran

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
