Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91823C54E58
	for <ath12k@archiver.kernel.org>; Fri, 15 Mar 2024 19:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Suxdcnma40ae0kL5FG73gQfD//0Ztl4MFPSaRXJo9aI=; b=vrbRLc/ILEJJrN+8nxllpD/gyu
	/j51c1XbgwNSlpqsZAmAzVDG+1d37gMeTNF6AbIYAahry8o0yYXtqpV+czHYbVtb1Lw9pr3PnEzZK
	9UIP+b2ajTwNmuWkD+WDeaOIc15QfuqswlY3OtuJWlb/aYBu1vv5IHVb8bIjuEg2teUnUIqEl6eEJ
	nE3K6xEMEQQyiehpWF0NGA09g+x+ivKGetaymeQ6CyVYLtMp1q/mT5S8JwFEH0c38Tu7m/vFDzn5e
	ASJ7R9KiOh5VyoeXcjN0yxV+xo6PLjqhKY6jRbsst9ro1Lt8YsPmBrOkdzw+3o3nM7iyY8QMFOr6e
	U8CY955A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlDeJ-00000001MLl-40kB
	for ath12k@archiver.kernel.org;
	Fri, 15 Mar 2024 19:55:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlDeA-00000001MIw-3zcw;
	Fri, 15 Mar 2024 19:55:25 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42FJeEiR012606;
	Fri, 15 Mar 2024 19:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Suxdcnma40ae0kL5FG73gQfD//0Ztl4MFPSaRXJo9aI=; b=Qy
	v6gDGBtGhleJPo/w6jXGubs8HDqxfK6WzxdDg+4NiIvVdKXBNbP51MmQRayrbxsI
	ffyU+IzmhGVqRT4amsSAuyB0/x35K3QwT21+gZKIlvFBw7EKNn3mHLWfITAWdp6H
	amusFltUszGaCIG7Y7cPmaO2h5j2h7DFHrWO/fP+TAJ276fdUDvo8HqTPkg9pvmH
	mx6fp4X0d/W/t3SQRwZ8UzIW9eC9++coz/8p+6ifkVhlvo+//6fRxwUVjIoXR3KD
	7IeoTudBb+hTtbTKj8rqK4tyubs5a6zBRslYfYDeqyFAUnQ1V7IEUdN2fmelqmBB
	1iMVzIPEdwIFxgGM1N1g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wv9yq1vwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Mar 2024 19:55:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42FJtBje029972
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Mar 2024 19:55:11 GMT
Received: from [10.110.89.243] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 15 Mar
 2024 12:55:11 -0700
Message-ID: <6874f568-88dd-40cb-bf57-d41b2d7aa41f@quicinc.com>
Date: Fri, 15 Mar 2024 12:55:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k & ath11k beacon miss detection
To: Nicolas Escande <nico.escande@gmail.com>, <ath11k@lists.infradead.org>,
        <ath12k@lists.infradead.org>
CC: Kalle Valo <kvalo@kernel.org>
References: <CZA2NS7J83D4.18SU6W9R96KPY@gmail.com>
 <a35eca5b-e6e6-46e8-85b5-dbcbda0d2f04@quicinc.com>
 <CZU8N7QWGITF.1DC5A13NM18UI@gmail.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <CZU8N7QWGITF.1DC5A13NM18UI@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fAtpqANj5Xxi1dpen7QrSLdizRKFml92
X-Proofpoint-ORIG-GUID: fAtpqANj5Xxi1dpen7QrSLdizRKFml92
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-15_06,2024-03-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=639 bulkscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1011 mlxscore=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403140001
 definitions=main-2403150157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_125519_198959_D0702B63 
X-CRM114-Status: GOOD (  14.04  )
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

On 3/15/2024 3:06 AM, Nicolas Escande wrote:
> On Wed Feb 21, 2024 at 1:46 AM CET, Jeff Johnson wrote:
> [...]
>> The ath12k driver is still work-in-progress and there is quite a bit of
>> functionality missing there due to the refactoring to handle 802.11be
>> Multi-Link Operation. However I'm surprised that ath11k has this issue.
>> I've asked the development team to look at this. It would be helpful for
>> you to open a bug to track the issue. Please see
>> <https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport>.
>>
>> Thanks!
>> /jeff
> 
> Hi Jeff,
> 
> Any news from the developement team ? Is this something that got into their
> backlog, or even better, got a chance to be looked into ? I'm sure if we tackle
> it on either ath 11k or 12k the other one will be trivial to fix.

Yes, there is an ath12k patch under internal review and test. Hope it will
reach the list soon.

/jeff


