Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9414BC71130
	for <ath12k@archiver.kernel.org>; Mon,  7 Jul 2025 19:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsTdXAqzbwRiweAJeTreHIDlEx3TVbwkfu8OKafAfwA=; b=MCMcMqccgxN1WU0s2Imfqjyul5
	HtLcUj0uB/8HuvgSSfu4A/Ohu0Z0HhWRjqYHwk1BPQwT4zycHrCU+lVHgE96OlTSL1qP+G3skM+yS
	Ar3YPAyoImf/gtHzetUlmw34cVk0atBkAEiIKiYUSPhH5a3YZWEEn8YlPN5VJ5/ZqDV1gRcK+6F4G
	JR5g6jtnA7PNV8qLMnjpXnjJ7Rv7+egkqnmBMH3GIG64GiqhoR+n17pOE1WcQ9KWFiUrC5h0GWKSn
	0db1f1fc5OHTA8RaQ6ucnb4wG5p5o7umlAnn1zqg2a0BjIw83fYtXWtWbyzYb+QLKz5oJpE+o30dl
	U7R1dgMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYrDJ-00000003PM8-1Rq2;
	Mon, 07 Jul 2025 19:09:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYr9T-00000003OeE-28oe
	for ath12k@lists.infradead.org;
	Mon, 07 Jul 2025 19:05:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5679TJfd021652
	for <ath12k@lists.infradead.org>; Mon, 7 Jul 2025 19:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jsTdXAqzbwRiweAJeTreHIDlEx3TVbwkfu8OKafAfwA=; b=BAuoe74WuHZXXQYT
	oSG45QPN/fxj2ZOWZQCsckCYdtj1kQcwXYwh7Hd4kq6hJdO4hp+QepYTGgpnOUH0
	TLMZO467aDKDphmRgyQlQY8VV1nZFae4klKDMJFF8250NChAP8/XoO1xJQkE6mVl
	VJWRIzbaSYNIrD81Hg/VeiFn9qM66E+8KnxhKQDh9yrdZ4mROoPRReTORRAdP0qF
	7k4Y+yKfpRx14GIz83Qf+nmXZAmFKrETSRHPQL247lxCI9XShdA/vp7Cp/MNDLgl
	CGSVmv6PipnzR4r3DFwwb1KiTLlojLthZ98seuL+1C4lagAqYppNPdEJdLypJSnF
	bxe0RQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7qfa8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 07 Jul 2025 19:05:18 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b3928ad6176so318947a12.3
        for <ath12k@lists.infradead.org>; Mon, 07 Jul 2025 12:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751915117; x=1752519917;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jsTdXAqzbwRiweAJeTreHIDlEx3TVbwkfu8OKafAfwA=;
        b=Gd5vl5ji4ipkdWaolVik7xvnKR3H16nVtiMGujxTIUP19511CyiE7ADp3CGKFf/K/n
         +j/eY170APjAkzQpVHPH9FoXTTs+LV1250levPb6FF/mbs6sXw6CtG3KY6PaxJshYV6S
         kxBdhAy1BFXlO6/JjqqO+X1pOj1xD0jWgFdsr84OzcG78JQOfo1J/657/xJPDAcKzQ/+
         h0EroJDm9qzQtF20sIXWI79rJc5CoDN2w+rAOvq98tGUNLre2bSyYdimymewwNXjKVJY
         ibqjj0m+AaL3u1ik/81f+rHeBB4J+Oz6VQm9o6VyS5Ik/0diD15ltXhUEViM1KwK9suT
         pQLg==
X-Forwarded-Encrypted: i=1; AJvYcCXRcgWvAo/ci7W4N3EJtmS7TuvyuIX631FT4AIziDQAZVlqJ0Ot/3nFNZe1+fxY64/Yig+5eV8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdMhlx5blXNM0EjLpX8LF6v4lmTNdUM3AejwYtOAIOeRrp5KeG
	LfYbj1Ux4o/Qr3z20oNVbiollZcaIhWNI9N0lR4IGMSSOw6nWOCUvdAUSRvGbShCzsiF2a2zp6a
	YsS6qPTzcuXaJn7PsF8fUW0GlfKyTLSeEYir1HqM3xBLF0bv+e8+9HGC2rSu56GUqxHO9l2X4
X-Gm-Gg: ASbGncutQgH5mxFc6ti+SGdErwY7ne5hnIX6QRPhrC1ag7wBRyNN3ZtrEcVR6o2UzgB
	hnZ+2ajoWBQ2Rj2JhxWaKYYqsUlkTb/4uQQbSTO85u4wz8MRCmMoCaeRKkOL+wFM1kRdEuLVPVs
	loUv1TYklP7VR+4y0VjgkUztaqGz2LwBC0svk4nbm0Oe30y0TiEo5REnL9zBQIWSJdoi/NITy6c
	buVdysipXp2vObOZ0VxJGz0iGWUFkXErpZNYz1fnioaYQmIbgfF0bY01+eFJF2hvYNE+25oRhMM
	svtX9XNcmXztM7sHe+HEO974iZAbA0g2qhMK2iyiMAvfyqk6HYgBnUHPzWsrDInTOBGi6tDJ2r0
	M0UWok6/HO4s89Gk=
X-Received: by 2002:a05:6a21:920a:b0:1f5:882e:60f with SMTP id adf61e73a8af0-22b438d2707mr263982637.17.1751915117107;
        Mon, 07 Jul 2025 12:05:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHr83xlA6HKmhSNZcd2CoeB9isQNFJXc5M84pANYDDK+A/XRCNtW7/5oSgPI37tP57E0Wdq/Q==
X-Received: by 2002:a05:6a21:920a:b0:1f5:882e:60f with SMTP id adf61e73a8af0-22b438d2707mr263938637.17.1751915116497;
        Mon, 07 Jul 2025 12:05:16 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee478b30sm9471979a12.27.2025.07.07.12.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 12:05:16 -0700 (PDT)
Message-ID: <10d52ab4-a0cd-445f-a23d-9396904b10df@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 12:05:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: support average ack rssi in
 station dump
To: Nicolas Escande <nico.escande@gmail.com>,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Sivashankari Madhavan <quic_sivamadh@quicinc.com>
References: <20250612114620.1055840-1-quic_ssreeela@quicinc.com>
 <DAKJLG9RLFCQ.3H8XQHL8ZY3GT@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <DAKJLG9RLFCQ.3H8XQHL8ZY3GT@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDEyNyBTYWx0ZWRfX41NT7ZaVno+9
 bW7doNo0xq3k3Zka5R6ljQqV333/O5o+22XdY+OXvMMZbioKH/b2KTuxIZV2390imditywsvTic
 FAHk17qaNY/74LYRu6Crhy8f/jAC2EsKDoMozlFv1SehZnZmECieb0rDCjGwrSSZJwJkA9sKfNW
 tMWwLexFGvla78XCvB0rPX09ptO24OVOWJeNzQlM7remRXFoMu/uFw3XfeWfs05/61IDeYaPcsg
 T62ZDzv/Yjb6yt/Z/w9t9bFHO192JhCFVoMrVl0LrTVzfDL4p/XOtJUPcPQcua6xDqrKnF7vu28
 90nY4LL+q4jZntxpuemz2EguH54a/PQ40pM0/pNqvVKsHt7YEK6jfq6Nm9wtsb3bEZYBDZr0LlO
 NQlZNI9bZjaCrzNg80OfrL8Z9AJw8MzBTT03tZs1uElr8ix3I1GjdkR9GJ0h4AgHdXHOAUFi
X-Proofpoint-GUID: T03kMHuE14W_vedEbfsACqM4ahyENrjQ
X-Proofpoint-ORIG-GUID: T03kMHuE14W_vedEbfsACqM4ahyENrjQ
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686c1a6e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=53z-MDVfSCvoV5mJ9WkA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_04,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_120519_566470_4CEEE7E7 
X-CRM114-Status: GOOD (  13.89  )
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

On 6/12/2025 5:10 AM, Nicolas Escande wrote:
> On Thu Jun 12, 2025 at 1:46 PM CEST, Sowmiya Sree Elavalagan wrote:
>> From: Sivashankari Madhavan <quic_sivamadh@quicinc.com>
>>
>> Currently, the ACK RSSI value is not shown in station dump. Enable WMI
>> resource flag for ACK RSSI in WMI INIT command to add ACK RSSI value in
>> management TX completion event from WMI. Update ACK RSSI value obtained
>> in management and data frame completion path to ieee80211_tx_info. Also
>> advertise NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT flag during hardware
>> register to mac80211 layer so that ACK RSSI is added to station dump
>> message.
>>
>> Example output :
>> Station 00:03:7f:01:5c:4b (on wlp88s0)
>>         inactive time:  46584 ms
>>         rx bytes:       955
>>         rx packets:     10
>>         tx bytes:       769
>>         tx packets:     6
>>         tx retries:     81
>>         tx failed:      0
>>         rx drop misc:   0
>>         signal:         -39 dBm
>>         signal avg:     -40 dBm
>>         tx bitrate:     6.0 MBit/s
>>         tx duration:    1185 us
>>         rx bitrate:     309.7 MBit/s 40MHz HE-MCS 6 HE-NSS 2 HE-GI 0 HE-DCM 0
>>         rx duration:    0 us
>>         last ack signal:-41 dBm
>>         avg ack signal: -40 dBm
>>         authorized:     yes
>>         authenticated:  yes
>> 	.......
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: Sivashankari Madhavan <quic_sivamadh@quicinc.com>
>> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> [...]
>> @@ -5651,6 +5655,8 @@ static int ath12k_pull_mgmt_tx_compl_param_tlv(struct ath12k_base *ab,
>>  	param->pdev_id = ev->pdev_id;
>>  	param->desc_id = ev->desc_id;
>>  	param->status = ev->status;
>> +	param->ppdu_id = ev->ppdu_id;
> Hello,
> It seems this ppdu_id is retrieved from frimware but not used in this patchset
> Is this by design ?

I'm guessing it is for completeness (parse all members even if they aren't
used). Do you think this is a problem?

/jeff

