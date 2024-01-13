Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C8CC3DA79
	for <ath12k@archiver.kernel.org>; Sat, 13 Jan 2024 02:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cM8fIaehgJMklMVOd/tedYVm4URXb2TVGyy1kxUWmCY=; b=fMmXOCSu25+aky9jtautV1fYth
	P9ucG1nvZ0eGC/400ZVDJWgBJsFOmbGO/EnocNW77Lbya/1IIyVp98oBdnjZTtGmMyF6lACzsCKY9
	2PYryjKP1bWXTVpkvVdOsP59eZuD0v6IBAMgLwrc8UNM0EfOKoh+dazPsQPeuVlj+eRBmMybDNsaD
	69eCPg/CN0lDlvvWDJ9r+2SRbZJ5aSIksVaQLYqTeeZ2Al/CQvwiJ3sMIrw0Z9xHRRMLQE/o6Sqbr
	0qpVgMGOhMEImJoPXJeFtJrTUbs7q1mWlSH39/YjyOTyfxavwxnfaSBQ8mQXwiIB0qLO0K3KuMOf3
	refRtjgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOTPP-004Qnz-0t
	for ath12k@archiver.kernel.org;
	Sat, 13 Jan 2024 02:06:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOTPI-004Qnc-35
	for ath12k@lists.infradead.org;
	Sat, 13 Jan 2024 02:06:00 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40D1xEQC018915;
	Sat, 13 Jan 2024 02:05:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=cM8fIaehgJMklMVOd/tedYVm4URXb2TVGyy1kxUWmCY=; b=Nt
	MpbyLvrFWLaNVsMkgkMnpqvYNwpfm3OuO4V3NZM3wqWekBE1L9ur/Gz9xxK/lkKM
	Tg59xyCIDBnMWrJenRfxlCpOt8ORxC6M6OCNEsYrPNLt9RBYgDys2ZWw13pMskhP
	eGAEs8RjH3JS5zBcVoTkw7CgocvpdC4tZVbMlj1+POeumZpiptgeU6kRmMc81+p6
	oS/AOHVsEwl3TpOd5HN3MZPKafix9yOZVyrv7DHFC/wWiIzRs1/rMkXGpRm/0o7d
	fMDw2CB5J8scnqYwk6z6C7yLH2ubgfTaYK2EhMKdbPd5LVZcTt1/O2Hul7r2fxAQ
	MckaQVU+zQRVOB3hagFw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vk6ee9eaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jan 2024 02:05:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40D25meU014108
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jan 2024 02:05:48 GMT
Received: from [10.110.118.97] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 12 Jan
 2024 18:05:48 -0800
Message-ID: <25e2a46e-51a3-4bae-836e-6ceb2b5c4ebe@quicinc.com>
Date: Fri, 12 Jan 2024 18:05:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/10] wifi: ath12k: implement handling of P2P NoA
 event
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Kang Yang
	<quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240112092824.7664-1-quic_kangyang@quicinc.com>
 <20240112092824.7664-4-quic_kangyang@quicinc.com>
 <b1cb2130-ca6c-525e-4370-ea0acbd73138@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <b1cb2130-ca6c-525e-4370-ea0acbd73138@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ou_cYbLxfdPbzc6PZQRfFJU5-71NaeBg
X-Proofpoint-GUID: Ou_cYbLxfdPbzc6PZQRfFJU5-71NaeBg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1 suspectscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=210 clxscore=1015 malwarescore=0
 impostorscore=0 mlxscore=1 adultscore=0 spamscore=1 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401130015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_180557_023221_CD6831F8 
X-CRM114-Status: UNSURE (   7.81  )
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

On 1/12/2024 5:35 PM, Karthikeyan Periyasamy wrote:
> 
> On 1/12/2024 2:58 PM, Kang Yang wrote:
>> +	ieee80211_iterate_active_interfaces_atomic(ar->hw,
>> +						   IEEE80211_IFACE_ITER_NORMAL,
>> +						   ath12k_p2p_noa_update_vdev_iter,
>> +						   &arg);
> 
> 
> ath12k_ar_to_hw(ar) is introduced to avoid direct access of hw from radio (ie, ar->hw).
> 
> This new helper function introduced by the patchset "[PATCH v2 1/2] wifi: ath12k: Refactor the mac80211 hw access from link/radio"
> 
> 
> @jeff
> 
> Any comments ?

you are correct, we should use the helper function
Please rebase on hw abstraction series

/jeff

