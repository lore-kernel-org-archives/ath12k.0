Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E38C7618E
	for <ath12k@archiver.kernel.org>; Wed, 26 Apr 2023 16:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NAktc3OxPsbWEasP2GXODX8SfkYs2qHbrgLU1bvsyvk=; b=AEHdZH6GFYuQYR
	sp7O6XBwgEXlsAzYjf9QFu9GIXPlfuZuh6UzVo8Tz2LnKxJC/c2+QmjRmIuCs9fYnWNORfZG4SyQw
	nJOqTS1hJHTl3l2JfUIihGov//mNGCoelGWZbzs1DaPHq1M5/eTowCaKSnqRl0J+75/RGMmAgkWtF
	bD1AhkDmk23dbAOV9kbDvawKGhy3VT5i2PHLIGy3VJW8OAlS9Ox5d9dVeozxo5CJTTDN0kaskO++h
	A6OBvEaiJD0l/C9RiCKqGGCyy40ua/ruooSvg31jfuydH6A3tXIiSyBjipV0xiN+N1JXNVUIOnwBV
	WGYgnQ+kXdpwQpTnOuPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1priKq-004RZF-0K
	for ath12k@archiver.kernel.org;
	Wed, 26 Apr 2023 16:49:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1priKn-004RYZ-0H
	for ath12k@lists.infradead.org;
	Wed, 26 Apr 2023 16:49:38 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33QG4XYH025015;
	Wed, 26 Apr 2023 16:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OGFCBSk9Ao2wgRC4CQBkJE67+vbisEmpOdkqP44I7UI=;
 b=R/wF55uO4Xg6cf5yblw3Iv7d0+fvlOEmEF5rFQYnMQfcURLY4PVLdq3kaNvmMn1/Hfh+
 1+iOaTR9dkE+VCi2xJOmIOi3YWG/Bv84rSYlX8lV12uQ6Y6XuWqLuy0T2smpx5wn8Sfi
 zZRkFS7xilUfaer7FFjc15AlI3qf8fePa83tik0mH7s2yCzBmdRUNcI808/QMmQ437Os
 CV4cFlX9rlEp3tNVueKYTwXhho8HAQ5TkQMXDll27mYsz1QU5rknBL83OQeqoQxHYOOi
 +cxv2w0m+/hZ1ZS2SpzK630IkNgRy2lHsKxQok8OcjLUyq4bDsawDLpanyxJjyHtnigA rA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6uprst0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Apr 2023 16:49:30 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33QGnT3i007847
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Apr 2023 16:49:29 GMT
Received: from [10.110.11.241] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 26 Apr
 2023 09:49:29 -0700
Message-ID: <759bf2e8-ce51-b882-7d26-7ae57b8cf571@quicinc.com>
Date: Wed, 26 Apr 2023 09:49:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 00/11] wifi: ath12k: (v3) EHT support
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20230413215156.2649-1-quic_alokad@quicinc.com>
 <87ildjtc1c.fsf@kernel.org>
Content-Language: en-US
From: Aloka Dixit <quic_alokad@quicinc.com>
In-Reply-To: <87ildjtc1c.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8Ua1JzCLdsQzG9TIEPwsyCC_wqqpXbmD
X-Proofpoint-GUID: 8Ua1JzCLdsQzG9TIEPwsyCC_wqqpXbmD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-26_08,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxscore=0 clxscore=1011 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_094937_262374_63AC3313 
X-CRM114-Status: GOOD (  11.50  )
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

On 4/25/2023 11:03 PM, Kalle Valo wrote:
> Aloka Dixit <quic_alokad@quicinc.com> writes:
> 
>> Add driver support to bring AP up in EHT mode, configure a preamble
>> puncturing bitmap and associate with an EHT client.
>>
>> v3: Modified patches 6 and 9 to fix some issues,
>> changelog included in the respective patches.
>> v2: This version modifies only few commit descriptions,
>> changelog included in the respective patches.
>>
> This breaks WCN7850 support:
> 
> [  144.039164] ath12k_pci 0000:06:00.0: BAR 0: assigned [mem 0xda200000-0xda3fffff 64bit]
> [  144.039315] ath12k_pci 0000:06:00.0: enabling device (0000 -> 0002)
> [  144.046220] ath12k_pci 0000:06:00.0: Hardware name: wcn7850 hw2.0
> [  144.118539] mhi mhi0: Requested to power ON
> [  144.118716] mhi mhi0: Power on setup success
> [  144.222303] mhi mhi0: Wait for device to enter SBL or Mission mode
> [  144.627712] ath12k_pci 0000:06:00.0: chip_id 0x2 chip_family 0x4 board_id 0x104 soc_id 0x40170200
> [  144.627945] ath12k_pci 0000:06:00.0: fw_version 0x1005bc12 fw_build_timestamp 2022-10-11 12:13 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> [  144.959196] ath12k_pci 0000:06:00.0: failed to parse tlv -22
> [  144.959317] ath12k_pci 0000:06:00.0: failed to parse ext2 event tlv -22
> [  150.263567] ath12k_pci 0000:06:00.0: failed to receive wmi service ready event: -110
> [  150.276547] ath12k_pci 0000:06:00.0: failed to start core: -110
> 

I have started seeing ETIMEDOUT on QCN9274 as well, AP bring up fails in 
vdev sync. It works if the sync timeout is increased.

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
