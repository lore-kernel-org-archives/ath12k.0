Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8518AC36002
	for <ath12k@archiver.kernel.org>; Mon, 24 Mar 2025 08:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GiZikm6IvzzQWX6CT9gL5kOPLfz2b9r0DDzgSO0bZyo=; b=VxCt/FVx3hs+hEfzOn1yRMIU5M
	BWPP+qdItMGgiVLxuh57zlM5EXnCtQvcpzXQaQE8JcYGgh0rCk2ZPiPaI7Rd0mJiQ4uL8XEDE9vXj
	fwmJ4DJD0K10Oz9Y+MbavQNtxWvARsjDYgnNvzYfffiar7cwIyuMkbArWX/PfbqO8o1NAEEndF05w
	HCvFPjduYSfLXqiV7KLugVy9C2jd/8v1GwTuKCIv4A6bdRKTCiTgNfk3OYIFbFzWOKWCFw9yR/3UE
	0nMIP/nKOBcOMY8ujCg1fTYAs2dqHWVM1uYxWMGzxGbJBAddLAA4ZvDiYKqO7G+JTsawnZBJrUkCn
	OYI8pMAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twcpa-00000002XPq-1IGk
	for ath12k@archiver.kernel.org;
	Mon, 24 Mar 2025 08:06:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twcoZ-00000002XET-2DRb
	for ath12k@lists.infradead.org;
	Mon, 24 Mar 2025 08:05:44 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O6c3a0001787;
	Mon, 24 Mar 2025 08:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GiZikm6IvzzQWX6CT9gL5kOPLfz2b9r0DDzgSO0bZyo=; b=kQm5eO3I3oNcWYSL
	sK/nlPLVwfrjXEaFj54BQUKK7mTTmHc8iA+nUK7Ic1mzbdY69qPKEp5VQC4OkaG5
	tT7G0Jn82IhzY3vSHyNsRfbrY9T91hxkdZejL2MYNoCbMTYw3AjYj84UDr1HAPMC
	+divdF43wt5zVQ21eKMx17oLg1IQ6tLV0BntAqA01Tzjp/A1wAppgbawvarnY4hR
	zihgv+yPwSnwfPoUUzUtwBo9XaA0hmpeYmICcjEEv4TuerEej1AwPebQXYQwujm+
	NGXdau6OEo82huNZp3DKxqFMMm/wF8XI2K8rkR/4e6nt7LH9kUrkiFmqJK677yAZ
	W/muIA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hm5uumu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 08:05:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52O85dbU011050
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 08:05:39 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Mar
 2025 01:05:37 -0700
Message-ID: <a1aa02e8-7f58-46ae-b3df-ae43288cf683@quicinc.com>
Date: Mon, 24 Mar 2025 16:05:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: extend dma mask to 36 bits
To: Johan Hovold <johan@kernel.org>
CC: Johan Hovold <johan+linaro@kernel.org>,
        Jeff Johnson
	<jjohnson@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        <ath12k@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250321162331.19507-1-johan+linaro@kernel.org>
 <bc3601ae-5639-4ee4-bbcb-4e39b542bfbe@quicinc.com>
 <Z-EMgPg5Gp-JtTZp@hovoldconsulting.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <Z-EMgPg5Gp-JtTZp@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jyA0r0eLjHC-X6nZZ87De9CCb1vuhA17
X-Proofpoint-GUID: jyA0r0eLjHC-X6nZZ87De9CCb1vuhA17
X-Authority-Analysis: v=2.4 cv=AJKH5mlP c=1 sm=1 tr=0 ts=67e11254 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=2XIbIgQLYS011rX2vRkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 clxscore=1011 impostorscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=888 adultscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_010543_580852_C8A83D6B 
X-CRM114-Status: GOOD (  20.86  )
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



On 3/24/2025 3:40 PM, Johan Hovold wrote:
> On Mon, Mar 24, 2025 at 11:06:16AM +0800, Baochen Qiang wrote:
>> On 3/22/2025 12:23 AM, Johan Hovold wrote:
>>> Extend the DMA mask to 36 bits to avoid using bounce buffers on machines
>>> without an iommu (under OS control) similar to what was done for ath11k
>>> in commit dbd73acb22d8 ("wifi: ath11k: enable 36 bit mask for stream
>>> DMA").
>>>
>>> This specifically avoids using bounce buffers on Qualcomm Snapdragon X
>>> Elite machines like the Lenovo ThinkPad T14s when running at EL1.
>>
>> why bounce buffer is used at EL1? is it because IOMMU is not working at EL1?
>> or even because IOMMU is not present on Elite machines?
> 
> As I mentioned above, the IOMMU is not under OS control. The boot
> firmware / hypervisor has configured the IOMMU in by-pass mode and it's
> effectively missing from the OS POV.
> 
> Note that this is also the case on Qualcomm platforms like sc8280xp
> (e.g. the Lenovo ThinkPad X13s which already benefits from the extended
> DMA mask for ath11k).
> 
>>> Note that the mask could possibly be extended further but unresolved DMA
>>> issues with 64 GiB X Elite machines currently prevents that from being
>>> tested.
>>
>> could you help elaborate how it could be extended?
> 
> The mask should reflect the capability of the device. That may be
> 64 (or 40) bits, but I've only been able to test using 36 bits.

are you talking about QCN9274? As far as I know, WCN7850 does not support 40 bits or more.

> 
>>> Also note that the driver is limited to 32 bits for coherent
>>> allocations and that there is no need to check for errors when setting
>>> masks larger than 32 bits.
>>
>> why is it not necessary to check error?
> 
> The DMA-API documentation was recently updated to clarify that there is
> no need to check for errors when settings DMA mask with 32 bits or more
> as the call will never fail in that case. See commit
> 
> 	f7ae20f2fc4e ("docs: dma: correct dma_set_mask() sample code")

thanks for the info.

> 
> Johan


