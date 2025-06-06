Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899E3C5AD49
	for <ath12k@archiver.kernel.org>; Fri,  6 Jun 2025 05:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knQ9FYqptlxXML/XjbQtWd3J4JYCXMH6E4N6v1oPHTg=; b=I5yVYUb5rG6bfATBIznrvggQUL
	G+qzacnlJeobR7KdddrCVG26uMpFZcgtbrJTBqH29zin5tSALZw05NyglYf/oxV+U+sb0rXtIGwu6
	8l415JkQQaqK7/UBjpP25him4vja+aGQOgLd+AJLgMKhl9OgkHc9kx3MnZxzx5j4xrhdsVM00aR+O
	5XsIV0zmATM0Bmqg2Wryd/hJ3syitmltX1E/nITNPRgRdevL8jsUFcZPvtg7ASGlCRZ7V8rCYIU1Z
	Wb+SJjL0itVtSq57WKnDg5Zshirr4NPqYGwKn2hmQvHLTwMNQqB+VMVz5FqFMN7cdIuyDBfKj6cLN
	ePihy3WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNPTh-0000000H7dG-165v;
	Fri, 06 Jun 2025 05:18:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNPTd-0000000H7cn-2v0N
	for ath12k@lists.infradead.org;
	Fri, 06 Jun 2025 05:18:50 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555Hg3F2006645;
	Fri, 6 Jun 2025 05:18:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	knQ9FYqptlxXML/XjbQtWd3J4JYCXMH6E4N6v1oPHTg=; b=oSuCpLgH035rLQYG
	LbxtarYeZ4i9xzoywqcy+hQf9eJk+JaHO0P4yVvitTSXIcBBx7ZnJcod3rsfmj3M
	S9P+4qocO1os/jWyWIIMN7p0RgNB2ucfoRTSHyeXCZ/N3P7S5lmMrz6pRe1X4APE
	0o2pqwEZ60hb4HpuPTDGwRpW1NZe7uVLSbkJm6i9HGzH0kb+VK7IukwVsA3vN6FZ
	LSUxxr2MtTdBdBld+vQc7lp8kfUCFIRt2WrUN1+BqinSEJ6VbPqyz8nzvJNd5fsp
	7jYfshWnhPXJbEbmmN1b3KtipoIVM2i1RtJtvShZX6RChRM9Rh1W4A993RsfIYxU
	SBznww==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t3h43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 05:18:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5565IWBQ019491
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 05:18:32 GMT
Received: from [10.216.44.241] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Jun 2025
 22:18:30 -0700
Message-ID: <5c17e765-8975-c3b7-ff0c-3bef4862d1f7@quicinc.com>
Date: Fri, 6 Jun 2025 10:48:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: ath12k: big endian bringup
Content-Language: en-US
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson
	<jeff.johnson@oss.qualcomm.com>
CC: Jeff Johnson <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
        <ath12k@lists.infradead.org>
References: <aD8HK4Iagc99skN5@FUE-ALEWI-WINX>
 <ae1215c7-5ea6-447c-8c07-5667e13dae89@oss.qualcomm.com>
 <aEE37D3hvlJmcN5E@FUE-ALEWI-WINX>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <aEE37D3hvlJmcN5E@FUE-ALEWI-WINX>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vbFEfXEq2t2tGl_mYoiX1lA6ZTd3PsPm
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=68427a36 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=naxTaKGYvweH_6U3_8wA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: vbFEfXEq2t2tGl_mYoiX1lA6ZTd3PsPm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA0NyBTYWx0ZWRfX1JXERzJzavT6
 AkL3UaaWYtes1us7+lgtnR2+JLtNeEtqaBs6SVBAIciOQjxJwxS4ADrOIK0wxl8wiFS+xD2teFf
 bWZ9N5saCQ7GF/lTjqWPBwJkrMIresNWqzDUpUMNPAKwPMY+ScQRttAcJB2LhW9MPiC/agdlWO4
 fcI6yMv5E5j4yI21/PVZAtvO5AFpu7jPVP9EN1EfliBQYDv17Kjy+nb6YRRkjcQnkINpqf4iCQG
 y+C6U7lD41GKHrfmC8rOJgKYybwwzGabiEkLw36dXsWNxVC6R0dHk3I5Xj7NIsSmbmMSkNU4mAF
 wzJ2mOmzzDJI6K2AkfAqRjuvy60alYarJLQ4A686gLIkE0lsATXf1a57xMa6v1ywCRHphxr3ZTI
 X3nF5bHObHmIWVq64FfKdf2783ARrAbsW3pgJbxlGl47B8on8ZPUcbWFvRqlHSgBrNXLYT+u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1011 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_221849_753717_7802394D 
X-CRM114-Status: GOOD (  24.07  )
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



On 6/5/2025 11:53 AM, Alexander Wilhelm wrote:
> Am Wed, Jun 04, 2025 at 10:30:40AM -0700 schrieb Jeff Johnson:
>> On 6/3/2025 7:31 AM, Alexander Wilhelm wrote:
>>> Hello devs,
>>>
>>> I need help to bring up the QCN9274 with ath12k driver on big endian PowerPC
>>> platform. I've already found some issues and fixed the MHI start procedure [1]
>>> and QMI conversion [2]. Furthermore I added some endianness fixes on 'qmi.c'
>>> file and could successfully transfer the firmware and boardfile to the wireless
>>> module. But the firmware does not start properly.
>>>
>>> I'm trying to analyze the error and don't fully understand what is happening.
>>> While 'ath12k_htc_connect_service' I expect a successful response from
>>> 'ath12k_htc_send', but the connection then is timeout. It seems that I should
>>> receive a message with length of 20 and at least I get one. But then the driver
>>> remains endless in the 'ath12k_ce_recv_process_cb' and I always get a message of
>>> length 0 from the 'ath12k_hal_ce_dst_status_get_length' until RCU stall happens.
>>>
>>> More interesting is the 'CE_ATTR_BYTE_SWAP_DATA' from ath11k, that is still used
>>> in ath12k code, but HAL structures now are swapped in driver itself at the same
>>> time. Is that correct?
>>
>> That does NOT sound correct.
>> What happens if you unconditionally keep the BYTE_SWAP flag disabled?
> 
> Hi Jeff,
> 
> I tried to do so, but nothing changed. I will verify whether big endian platform
> sets the 'CE_ATTR_BYTE_SWAP_DATA' bit inside of 'attr_flags' at all.

Byte swapping will not get enabled in ath12k for big endian platform.
CE_ATTR_BYTE_SWAP_DATA and and other byte swap related macros are ineffective
in ath12k, CE_ATTR_BYTE_SWAP_DATA is not really added in CE_ATTR_FLAGS.


> 
>      ath12k_pci 0002:01:00.0: rx ce pipe 1 len 20
>      ath12k_pci 0002:01:00.0: Target ready! transmit resources: 4 size:4096
>      ath12k_pci 0002:01:00.0: boot htc service HTT Data does not allocate target credits
>      ath12k_pci 0002:01:00.0: Service connect timeout
>      ath12k_pci 0002:01:00.0: failed to connect to HTT: -110
> 
> But I found the problem for the above log in HAL. I set the '__le32' type for
> the 'ht_addr' and 'hp_addr' from 'struct hal_srng.dst_ring' and 'struct
> hal_srng.src_ring'. Now I am one step further and have some capabilities issue.
> By the way, maybe you can help me here. The function
> 'ath12k_pull_mac_phy_cap_svc_ready_ext' differs now from the respective one in
> ath11k to overcome the endianness problem. But the following lines are
> questionable:
> 
>      cap_band->he_cap_info[0] = le32_to_cpu(mac_caps->he_cap_info_2g);
>      cap_band->he_cap_info[1] = le32_to_cpu(mac_caps->he_cap_info_2g_ext);
> 
> The same for 5G and 6G frequency bands. But it seems that the usespace requires
> here '__le16' instead of '__le32' ones. Can you verify that? Or maybe I
> misunderstood something.

No, it is indeed 4-byte. In total, there will be 6-bytes in mac_cap_info which
populated from two 4-byte information from firmware with some internal data
encoded in MSB two bytes of the second word which will get dropped when advertising
the cap to mac80211 (in memcpy).

Vasanth

