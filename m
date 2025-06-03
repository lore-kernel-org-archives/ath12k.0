Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DC9C5AD49
	for <ath12k@archiver.kernel.org>; Tue,  3 Jun 2025 07:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2BWZNGPJOWlHzKILSvmV9Q7kH/ybABFKZ6Wme6g2VbY=; b=1PJzBHGqVaEPg+sF08q0O1pVVD
	7uONjn1igGdu6G8J/0cr8819JGqgi9wBqR42X9SxIyV0vTebBtfPuYaYCXohBPfDkPIemNgFVD/N8
	WCJIFawlCwIuuivDRG8PWmUqBDOcJWQjM3HUC7GQ97m6qh3mpJlxMdM80cVF9VrSwObtXUeVSYmOV
	bdjN/jRHcMLAiorovYV5whbNTGbCUszIePch3eb0Rh9MObnaLvSlpVyKiGs9hIGWefGOtcXvl7Pcm
	j7xqtiCTP14STs0kfI4a6JRT97gotQxB3YadCCrtiUQOPxnLNsfWuN+LWUzbXzDoJip8MHDh9eeMR
	LGB/tyuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMMEt-0000000AAU4-1TrM;
	Tue, 03 Jun 2025 07:39:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMMEq-0000000AATT-38El
	for ath12k@lists.infradead.org;
	Tue, 03 Jun 2025 07:39:14 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5536gUYP007730;
	Tue, 3 Jun 2025 07:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2BWZNGPJOWlHzKILSvmV9Q7kH/ybABFKZ6Wme6g2VbY=; b=hc5CxzPVqQ5MEHsh
	hxXDTK8Oe18Exru+f9aBjsdhgXjMSBqSDpLI5OGyr+VY6XeXh7gYdHmc57w3NSGx
	Q/LIqX+lDj4zFjidVmf7TaQbxgqevupZSXX87qZwWNeTInqHdGr5iNHaq27ZKHSu
	d1GKjACoWW8s2aDWVjRkmF/1MDheJWJAUZN9Ng6rh7ZBTwPqzUNWdUerb7kWh52O
	XpCNsv95MehSiD0BIq6KIPrYNU79JxpkpY9Sp+hEN56FkodmcxOTO5ubTYCQcadU
	2Im1zuVFc3SHvnTAxWyFhVNwMZRx/thLJ2iexv/pIOJ++PPxFqBUyyRIC2bfRNJR
	bp2J2Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8yhqwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 07:39:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5537d9SU009441
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Jun 2025 07:39:09 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Jun 2025
 00:39:08 -0700
Message-ID: <e8232a3d-6fbe-44da-aea5-769fc06c22cb@quicinc.com>
Date: Tue, 3 Jun 2025 15:39:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: wifi: ath12k: Attempting MLO with main (6.15.rc7) for NCM865 /
 WCN7850 in station mode leads to crash/backtrace
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: Benjamin Eggerstedt <benjamin.eggerstedt@gmail.com>,
        <ath12k@lists.infradead.org>
References: <BF352E86-5EC1-4FB0-8901-B62B6E400489@gmail.com>
 <78C6533F-E0F0-4961-9FC6-089F76BB59F1@gmail.com>
 <c6b01333-8437-4200-a66b-d678991c426e@quicinc.com>
Content-Language: en-US
In-Reply-To: <c6b01333-8437-4200-a66b-d678991c426e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA2NSBTYWx0ZWRfX0hhoAMEQLjL1
 9s+NV0/0uBXUDPkRKEe9efkBwmFrBEFToR9nr4yuXwBqljxE1fNfgh05bRj1YoSoReJHQsDxV1y
 aZR2cZt4fMkb2I6ad11f8IRnqOdMRPebWTabogO2nuaHLyESaOdeZihiZjEH91RAZ2gA3Gb5oQC
 MFXGDdgcD/axeqVxQ4tiwc8KzI6WIrrFi4zMTawBBYO00NxH4dn+j654ghQxOEYK0/VVoolbmSc
 BYIUKKcCMSg+QnmwuKXAjNk21Q3clYIotDH2Pedj4xFUjsOlHPv9vHEP18okxa3m6QqXXABwArH
 y54doNZa5RIGOLE7LanCRTRbwI0b5LEW0asUBCqqSJpUsMj7AAtlXTyolpad12DaybiEkvieSpS
 pM63Mq5CapplfhjEmrc69L3SqyEjdx4ybAhJcAjs1wa9dsnQu/ns+kOcV3ccOKDl8TjRznK3
X-Proofpoint-ORIG-GUID: MeFvrS8FZQs3uIWDiPQVHf2haELUUAGx
X-Proofpoint-GUID: MeFvrS8FZQs3uIWDiPQVHf2haELUUAGx
X-Authority-Analysis: v=2.4 cv=T/uMT+KQ c=1 sm=1 tr=0 ts=683ea69f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=v5EjKPavRdAgh5Q0G_8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=866 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 adultscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_003912_920885_81783CB3 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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



On 6/3/2025 11:01 AM, Baochen Qiang wrote:
>> - The vanilla v6.15 kernel gets a MLO connection but lost the ability to see 6 GHz, so MLO is limited to band 2.4 + 5 GHz
> This is a known iusse and the fix has landed in latest mianline kernel, could you have a try?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?
> id=d662c14a51910ba0ad66afd248b601ba30b9f7f1
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?
> id=37e775a0a9d79a031d28d9e21480f99f448e9215
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?
> id=886bb3624e4c9914a943b63fcfdf30b8d2f2b66e

Forget to say, WCN7850 firmware support no more than 2 links in an MLO connection.
Currently host does not limit on the number of MLO links, that said, with above 3 patches
applied you will see all 3 links, and then a firmware crash is expected. Well... there
might be resulting kernel crash as well.

We have a series pending review which add limit on the number of links could be finally
established:

https://patchwork.kernel.org/project/linux-wireless/cover/20250522-ath12k-sbs-dbs-v1-0-54a29e7a3a88@quicinc.com/


