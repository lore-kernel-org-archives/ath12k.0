Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F36DE77180
	for <ath12k@archiver.kernel.org>; Mon, 16 Dec 2024 20:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anA2jlQouZqs/KtQZgTzzrTT65T1vIzf5Zeno12iots=; b=h4n9e/LB9cf3PMyyqY9fs9KFlM
	qeeL2aR8W6a4d2k8zpozxJZ675/nOq0EisdqFpQ1fyzznrmoE92nJWF9EKgeEGOZ4ADbs6fWlm3ov
	M75Iz/KU8J7PABE8t+cYee2oTOavAi2etUk5DbD1pi7Lkn7mYYBwx/74aisuyEoUXBCXdhAK/Fefv
	x/y4tEyRBwMyhNjeEOF8gjoHaQ9MITTSqQ5wqMfzFHaaPqku8ryPHTUlWMa6dYfrqq/u9xZk8/24L
	beIEeccIWUaElkaVx8iBCnv7gkdghSTGuzqrfB37R5WlID1KxrT8mP5e4kbP2734/BaPX//2BdYs/
	ex2ZNgmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNI1q-0000000BJkN-0b7O
	for ath12k@archiver.kernel.org;
	Mon, 16 Dec 2024 20:49:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNI1n-0000000BJjl-1Qt5
	for ath12k@lists.infradead.org;
	Mon, 16 Dec 2024 20:49:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGH9ffJ017287
	for <ath12k@lists.infradead.org>; Mon, 16 Dec 2024 20:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	anA2jlQouZqs/KtQZgTzzrTT65T1vIzf5Zeno12iots=; b=ofVYo+j0Rac0BlV3
	zRdXpHfkHrbGIXERCTYL8E8apPqPLIrDztDaBeEWypmE5hT/J5vJIiNJUijAriuh
	VdVGOvhIW+nm4zC4xmgEj/bOMCzPSstmt54a34t2NpScTAKH/WCyDA3/mxs3j6bC
	Jk07xDIZ2EiMcZT+RJIrJ4xqRwOYtdYZ4EpN5+4jN+7YNOGoTTMzf9UimWuAbgGo
	KEHhjqU00FrHk6VoKHYTgCb3Fuzclq0y2iCKzQo/56je0CfX8CMBACJOOUmF5sY9
	nZFl6JjELjRmPTeBTeCVdzyLej1aTib6Y7h7X3hB4A0n14cQ2hldTBWH5T9hRDCi
	0eyu6g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jrc1rgmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Dec 2024 20:49:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-21631cbf87dso34609395ad.3
        for <ath12k@lists.infradead.org>; Mon, 16 Dec 2024 12:49:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734382156; x=1734986956;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=anA2jlQouZqs/KtQZgTzzrTT65T1vIzf5Zeno12iots=;
        b=v6V1OYnXPN3JSegfjql93imbNbB/nyz8akgSvKMrU31j5agc7SnHhC3Ogr33bCgrJj
         /vn9aBP+M7QOci3LcdbnlUl/C1S/o77boaTjZco8bVrW4ulLnPETlYAdc2vE1IXe6Hxe
         cRIS4Crc4qHsBLyNrNv2StQtcd2+l1F9b5qh8b7CJv2pjkvnMYbZc//+9HPBEf+veFeM
         4Z3IVX+23bBC+d9/CXjvatmUg8q+qkyHACmjSv0cz1mr5B1EcTpWZTAKr57u8q8ZcGB/
         M8y8A/9vFR+ZioBu5/Vdb37WiRdQli4NHC5uPQWR5asWVWsv8osGCgKHhdEeV86SKrW0
         GoDA==
X-Gm-Message-State: AOJu0YxrQlXM7RvXPXgrzCidVUvaFd/omJ4atpLwJ7UXjtJX1CJ+qzQj
	9wIitNK8kXuHmC+bgrcm1VTc2iLa5ipuXME6FGtF0dnS756PIfwsfMUCAvMRDAqQCfMaUyJ7hAI
	sqmGQ311/MtdJKSaIe37l0VvQKxgD2VR5eQa9jsi8QHhpnMQNXT/DDXiUHrs+
X-Gm-Gg: ASbGncue0oqwp32NZgY+y10jPwWUbLdH0B1tSkpcex3OV9gWtzbTu0mL0cLVIhbYmhY
	NlFKIShWf5cn3qOXZbkpLzGieJNJIKt5O9i7E80V8ug7HkgRt059ldjiBu4dfVApAVrKN6Ho6NL
	eih/m1ia+7P02vr6CGOpatAZY8XTjLwxu5xzVN3X56QLImkdwyOZdCJfzEby8JCQVUfYBRdekIo
	GdvLEMwgnSfXvTcXqp/F2feyzfy+xnOVgoUYJHY8Ixx6pPsZGqRPX6UH+F2yiTeS65eiSQM92bj
	BrSCJtSJ+Teeafq8Qpc9xTyqt/QZOgUbbwLgmBF2nWPn+oO3kA==
X-Received: by 2002:a17:902:f545:b0:216:5b8b:9062 with SMTP id d9443c01a7336-21892a706c4mr203037415ad.54.1734382155843;
        Mon, 16 Dec 2024 12:49:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWk9BZqboU3KwoVaqiVx3b8FL9B1OgxFHeyI/TAlRb715kIMdwZ9CqdRLUEBmLRsARD7gw0Q==
X-Received: by 2002:a17:902:f545:b0:216:5b8b:9062 with SMTP id d9443c01a7336-21892a706c4mr203037115ad.54.1734382155473;
        Mon, 16 Dec 2024 12:49:15 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e6634fsm47133905ad.246.2024.12.16.12.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 12:49:15 -0800 (PST)
Message-ID: <feaad284-9dd4-40c2-b6c2-a2a8411598ef@oss.qualcomm.com>
Date: Mon, 16 Dec 2024 12:49:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] wifi: ath12k: MLO support part 7
To: Conor Dooley <conor@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, Kalle Valo <kvalo@kernel.org>,
        linux-wireless@vger.kernel.org, devicetree@vger.kernel.org
References: <20241211153432.775335-1-kvalo@kernel.org>
 <173436785894.3413746.14923997859754791913.b4-ty@oss.qualcomm.com>
 <20241216-moonlight-perpetual-d49029337c17@spud>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20241216-moonlight-perpetual-d49029337c17@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uPOf4X2GT2Y4EpSgNeFAR3OTR18iToBF
X-Proofpoint-ORIG-GUID: uPOf4X2GT2Y4EpSgNeFAR3OTR18iToBF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412160171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_124919_511719_56CF698A 
X-CRM114-Status: GOOD (  12.96  )
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

On 12/16/2024 11:56 AM, Conor Dooley wrote:
> On Mon, Dec 16, 2024 at 08:50:58AM -0800, Jeff Johnson wrote:
>>
>> On Wed, 11 Dec 2024 17:34:24 +0200, Kalle Valo wrote:
>>> Implementing Multi-Link Operation (MLO) continues. Bindings document is added
>>> to get WSI information from DT (patch 1) with the code parsing the information
>>> (patch 2). Rest of the patches are about configuring MLO in firmware.
>>>
>>> Device Tree bindings were reviewed as RFC earlier:
>>>
>>> [RFC PATCH v3 1/5] dt-bindings: net: wireless: Describe ath12k PCI module with WSI
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/8] dt-bindings: net: wireless: Describe ath12k PCI module with WSI
>>       commit: 30e36fa89d8266d9221ee992d4f43553a59a3431
> 
> Delayed through being unexpectedly afk last week, I left an r-b on v2 a
> few mins ago. I don't give a shit about getting credit for tags, but
> figured it was worth mentioning it on the applied version of the series.

Thanks for the review.
I've force pushed an update which contains your Reviewed-by: tag.

/jeff

