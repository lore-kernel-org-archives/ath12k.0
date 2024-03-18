Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73518C54E5D
	for <ath12k@archiver.kernel.org>; Mon, 18 Mar 2024 16:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5uwoDH3kbCTXxeMutaIDHslrE1LQRXq9d9NNePLLkrM=; b=UVnZqnS8HbUIvwnHsO413iqewT
	MPOHl79lmfu43UVWIef52UZEJAP6XBljf/9h2QexujkVPoeiliq29qfgu0teRzKaSLYDN+fUIX4WR
	ofEFfF73eHDHqTFRvpDCDGByKVbpN4kyepfBwlYyw0mq972LDafo2gGNLAbOy/yU5OAPSrwKHJ+JG
	NdKHMK3xuRes8KDc+LcIQmpJHlufNVGa+JAufVHjwS6cCNPypFs4hZizl1XzGGk5XNg5lEqBP+7eF
	Vh/2uvekkkhDpASh6P/2Q3djr0Yr18fqaOHyYigZoEJCXofY9fuUiQCptq/chmTUHnoe6olSIAgnY
	KpdXeaJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmFRL-000000098jw-0lPq
	for ath12k@archiver.kernel.org;
	Mon, 18 Mar 2024 16:02:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmFRH-000000098jX-3seK
	for ath12k@lists.infradead.org;
	Mon, 18 Mar 2024 16:02:17 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42IBLbNH005204;
	Mon, 18 Mar 2024 16:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=5uwoDH3kbCTXxeMutaIDHslrE1LQRXq9d9NNePLLkrM=; b=jP
	BN2E5DbSTkXCTrwZz/mHDKCQ46NixffLKnzmuRtgXULJQKVfX+dSmAYIOdLjwt/7
	1rbxuH3TFxiqsVCwdraFDowiE+TmCg1R17ZnUg6in1wXoZvyzacqm3bVxI8rRivk
	El1az79gNwBlsHf18UFZdW+qWcjT3aNF8kT+jVESBTa5mD9ItSb6JWOLUxMdoHe1
	EDnrac85zir2Y7jlv2cEuB1o6He5jYNpDcoz1yOzrKyjkBCDmpIO0cl64PWPl2q/
	EeSzmKsbstH8+SMAJqIhBeI5hea1LX8WRmFhvIXSGqHvlvNG9Diw0iJH5q05TJDe
	mU7Bw6U5+EE+hx0tSwZg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wxmnjrmq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 16:02:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42IG2DuC020076
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 16:02:13 GMT
Received: from [10.110.89.243] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 18 Mar
 2024 09:02:13 -0700
Message-ID: <c1b44950-95d2-4185-b906-4296ceec123d@quicinc.com>
Date: Mon, 18 Mar 2024 09:02:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Add firmware coredump collection support
Content-Language: en-US
To: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240318060249.1023837-1-quic_ssreeela@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240318060249.1023837-1-quic_ssreeela@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hsbU_oQyHFKupgA1s5D41EVjVApHtmju
X-Proofpoint-ORIG-GUID: hsbU_oQyHFKupgA1s5D41EVjVApHtmju
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-18_12,2024-03-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 mlxlogscore=600 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403140001
 definitions=main-2403180120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_090216_045119_0B733A7A 
X-CRM114-Status: UNSURE (   8.29  )
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

On 3/17/2024 11:02 PM, Sowmiya Sree Elavalagan wrote:
> In case of firmware assert snapshot of firmware memory is essential for
> debugging. Add firmware coredump collection support for PCI bus.
> Collect RDDM and firmware paging dumps from MHI and pack them in TLV
> format and also pack various memory shared during QMI phase in separate
> TLVs.  Add necessary header and share the dumps to user space using dev
> coredump framework. Coredump collection is disabled by default and can
> be enabled using menuconfig. Dump collected for a radio is 55MB
> approximately.
> 
> Tested-on: qcn9274 hw2.0 PCI WLAN.WBE.1.2.1-00201-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

b4 shazam reports warnings when applying your patch:

Applying: wifi: ath12k: Add firmware coredump collection support
/local/mnt/workspace/jjohnson/kernel/ath/.git/rebase-apply/patch:35: new blank line at EOF.
+
/local/mnt/workspace/jjohnson/kernel/ath/.git/rebase-apply/patch:230: new blank line at EOF.
+
/local/mnt/workspace/jjohnson/kernel/ath/.git/rebase-apply/patch:298: new blank line at EOF.
+
warning: 3 lines add whitespace errors.



