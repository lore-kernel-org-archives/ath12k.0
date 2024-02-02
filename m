Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B196C4828F
	for <ath12k@archiver.kernel.org>; Fri,  2 Feb 2024 16:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LHRNUu7pDShbkJyGUNApyrlhyTyc68VFxP7JxnTHaBk=; b=Z0q2i7jqL0eDadtB3N8qi594gm
	hkpWTqHGUvgGJxPJYNYj+0zMV/rFXU1b9e/8eIPxqM9cn5hGCdx+HHpR9clLhrhWmdQCGaP2xuDWV
	nNDQFG4cYY85KIl7HCfHqU0GtCBsa+EZZIN+yr0pDwpGyhThYfM4tZ0NX9PWJOOdUMaDzgEpd7aC+
	LUss0I5W6wvi7gszfolGbyi4Bi4WLkglyQeJYE3bnWBiTtSgB2+cfO7Ee8x35rj6WRssczjbLGOdg
	jKvJNVPEPytFwNDmdFWsqx8RS9M1A+tkAeaqd9bcdIoEYgDp2sEPz3+4aad4Qyvjv0I+LqBJyzKuf
	L5ENQCAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVwam-0000000CNDG-2mlS
	for ath12k@archiver.kernel.org;
	Fri, 02 Feb 2024 16:40:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVwak-0000000CNCa-2HFt
	for ath12k@lists.infradead.org;
	Fri, 02 Feb 2024 16:40:39 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 412G97IJ028971;
	Fri, 2 Feb 2024 16:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=LHRNUu7pDShbkJyGUNApyrlhyTyc68VFxP7JxnTHaBk=; b=JK
	7PKQqvruVExiXLW5m2mCGzpU7/QfFmta2Pubb7Sf9mfpzbHhamn5LPu7zC20h/Cn
	/MLq4f6W9N9cSE9a8Q738nubinx/HNX6NSxFIOdVNLdWjedEibE9dDADSSBOVYzY
	dj07YS7PPSAVLFQGU1oTmbbLRMLM0Ba23FkTeAQKvKrpTlkl7Xsd23Wd8d/SCsaZ
	eGOr2zgyCIewaEtfwG3dRJLtpeqn71Bqz/y0ZfVMlV6sdNDeQcRWKI3Fo+VcVl6z
	Jb9jbC0Q6jYkrIeUiALFwQ3T/WdLNmTUk/9BoDp3rQDhkK5XTBl/9jS1ztXUe312
	nEkBxDr/kqWv0bnSCQGA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w0pwc1smu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 16:17:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 412GHATn031264
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 Feb 2024 16:17:10 GMT
Received: from [10.110.16.197] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 2 Feb
 2024 08:17:09 -0800
Message-ID: <c8919fde-6f02-456f-bd73-01b40d6437b7@quicinc.com>
Date: Fri, 2 Feb 2024 08:17:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: enable 802.11 power save mode in station
 mode
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Baochen Qiang <quic_bqiang@quicinc.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240201035830.2534-1-quic_bqiang@quicinc.com>
 <875xz7t1nw.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <875xz7t1nw.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GsN9xeGC0mRoNRA-6J3Gh1eoRe455luE
X-Proofpoint-ORIG-GUID: GsN9xeGC0mRoNRA-6J3Gh1eoRe455luE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-02_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=390 clxscore=1015
 phishscore=0 bulkscore=0 mlxscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402020117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_084038_601892_66D6D512 
X-CRM114-Status: UNSURE (   8.82  )
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

On 2/2/2024 5:51 AM, Kalle Valo wrote:
> Baochen Qiang <quic_bqiang@quicinc.com> writes:
> 
>> To reduce power consumption enable 802.11 power save mode in
>> station mode. This allows both radio and CPU to sleep more.
>>
>> Only enable the mode on WCN7850, other chips don't support it
>> for now.
>>
>> To test that power save mode is running, run below command and
>> check there is no NULL Data frame seen by a sniffer:
>>         iw dev <inf> set power_save off
>>
>> And run below command, then check there is a NULL Data frame
>> in sniffer:
>>         iw dev <inf> set power_save on
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>>
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> 
> This had simple conflicts in hw_params, please check:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=f776fd9ccb6561c4e4fdf05552a8b57a06686a90
> 
LGTM

