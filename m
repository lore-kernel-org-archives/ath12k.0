Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64204C2D0CD
	for <ath12k@archiver.kernel.org>; Thu, 15 May 2025 10:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rft6n8fXBKWE/PoOMe4vR3FkzYNDQ+Duvoc/6hc64Do=; b=sCOXxnXfpohIn3n9NsB5/w+4ar
	vYsvJkGTk8DC6JYdnzFn7VugbOWyZ9MLCNwDTjh1V/2tOX/cS7cGhhu3m8w0whEeI52zBmnsM1g4J
	IwbtdOb+1snEjLeyjloW1TLPetr7UvvCBPkf/HYjH4kmegLUvmXciOBasoRjDrwNTSA32d9TBK8Yi
	G5yVOgKZTqCI66GAfrDky9C4lSm66XLeMs9If4HtfOrXWdcgm6Jwv2Qa+E/enLq5mEASq1Ike+Lpt
	+xMKeobkvGkbBg5luv4C6Y5ohumr/gHojzgghEk3lIGdZZMHN4x26/6saCmuXXZjaxK2afQqbMz7x
	rgKkr3XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFW79-00000000KbO-0V52;
	Thu, 15 May 2025 10:46:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFW4K-00000000KJT-1ryZ
	for ath12k@lists.infradead.org;
	Thu, 15 May 2025 10:44:05 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54F8tBLi015942;
	Thu, 15 May 2025 10:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rft6n8fXBKWE/PoOMe4vR3FkzYNDQ+Duvoc/6hc64Do=; b=IjNzcljmwkFQVroq
	DtlCuf/302V3u/a/M8umluxyD911O/wQmsWidlhesVIL2nDQgK+tibhZxKJcD1st
	BIfacGn1yXvwgfdL7d1PoZkgD9lqMNVDEmdj1rDfl/7VAy/lSv527gbl+U5T9GEi
	ZyoAhafFiTQcNMTvylAkFvLqCskkdI8ldQ0ahaRxkLhVT57PWSudlIUk+pwRO6gz
	leNCMKB1C3T5zyRJq2SDeqsInxq/lqrJs9VH9JuGJDnN4u1Elr3cGNjCzH06i9+k
	afsncJhDvA0/jCOwP5VcX3I6DWvdJsjI185LUvGEQA5N7EbXB3B/iKm7j6EL1c2q
	NtH2Cw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmx0br-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 10:44:03 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54FAi3ug027364
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 10:44:03 GMT
Received: from [10.152.200.128] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 15 May
 2025 03:44:01 -0700
Message-ID: <9a7559cf-08c4-46ca-a263-4c912ebe0d06@quicinc.com>
Date: Thu, 15 May 2025 16:13:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix scan initiation failure
 handling
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250512065849.2833232-1-quic_vignc@quicinc.com>
 <52ff43fc-160c-4efe-ba9e-42a0c838fb3d@oss.qualcomm.com>
 <f0c8009a-829a-43f3-be03-c6b2a0b67883@quicinc.com>
 <ff4e8d8e-5835-4200-a479-baa0e44478f0@oss.qualcomm.com>
Content-Language: en-US
From: Vignesh C <quic_vignc@quicinc.com>
In-Reply-To: <ff4e8d8e-5835-4200-a479-baa0e44478f0@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: T8NfU7bacvrJiywO0NBRLZ72ev8zHnKO
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=6825c573 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=uWN3QdV81YwF6VYI-XUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: T8NfU7bacvrJiywO0NBRLZ72ev8zHnKO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDEwNSBTYWx0ZWRfX75iUfhy1TChb
 tqecFj6cylBbo3qo2L6579m0FsgT34kTU9TgJ8mJmaM0cH1yL14XBQb0f8KG43xc+yhM209TUDp
 73FXZI8Y9AgyBAYymc+PGulCWkdz37rv3BploULtLSUksrCCTWY0ccF+PpKwj8dWmRhazvQmWJD
 eobOnT2j/ik+Ri7+ws5QssjNIDbiowkjEwE1GknoyOf27+BGkXxEnjSuwLfFpmzYt4uT+Jv09y2
 CR41FgOYM1JX04ywePkL4CHrm8IL2v8iVDAd93hzW24rK9t8XpI1Y6zqkz2VsMnn2xdqhFF8EaO
 K3oIWe9+HWjX7+IrQfVVhpBXw2HVDiLfYJZAxd2J3SlfBkyQNJ8NNrdAC01HvLVYOQfhsd4wpht
 9a36/EDXWzjsjuKdJwROpx/Co0HQNEyiKVyXTUBUWzjILiDphBzLpIbru7u93xDQUPsqx6XS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_04,2025-05-14_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_034404_574928_B52A4FFD 
X-CRM114-Status: GOOD (  11.78  )
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



On 5/14/2025 7:17 PM, Jeff Johnson wrote:
> On 5/14/2025 4:48 AM, Vignesh C wrote:
>>
>>
>> On 5/13/2025 3:25 AM, Jeff Johnson wrote:
>>> On 5/11/2025 11:58 PM, Vignesh C wrote:
>>>> During a code review, it is observed that in the scenario
>>>> where scan initiation fails, the current code schedules the
>>>> ar->scan.timeout workqueue which is not necessary.
>>>
>>> Are there any user-visible effects?
>>>
>>
>> When MAC debug is enabled, the message 'mac scan started' is displayed, which is misleading in scan start failure scenario. Additionally, a scan timeout work-queue is scheduled to attempt aborting the scan, which is unnecessary in such cases.
> 
> Since there are no stability issues this is not a candidate for backporting
> 

Agreed.

>>
>>>>
>>>> In the scan initiation failure scenario, exit the code instead
>>>> of scheduling the ar->scan.timeout workqueue.
>>>>
>>>> Compile tested only.
>>>>
>>>> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
>>>
>>> If there are no user-visible effects then I'll drop the Fixes tag since there
>>> is no reason to backport this to stable kernel versions.
>>>
>>
>> Kindly refer the above comment and please let me know the next steps.
> 
> There are no actions required on your part.
> 
> I've made the change in the pending branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=4545ccf7efbd97566eb6d98738013bb6d72ced05

Thanks, Jeff.


