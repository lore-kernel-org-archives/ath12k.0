Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBA3C02183
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 19:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5mhQy/iLi/hHQbqK1N//sXRK2hJJG0CiemfOAYFPXk=; b=mzMKGghOgko3/4A5dr6meGjGL0
	QzfCFziMCbcX1N4HgvQQbt8Do9SdD3t3w0oTTeKfY4Q06GJLCpNTwca0OGxwXUZKi1mx/ns/689D6
	wu/4yYvhpD1hLrXDK/4/vN+SoQbV9y2a1V9ci1Qfg7WVPeowEKQE4RUXNR5OA9BgcCZdq+bLKafVL
	sF8QV2xhCVsTnHiiwjo4rD3DQvhRc7YOb3ntOntXgSO2STjImhVPODZdwa/6f979xEPKBvv0+0/Wa
	/pJt5+pMMm3LR4BKQOjQ8VlifBbTYmAEWr3USdnCjWHQAlV9gPHHEotXQZApl2uCv8JAPXgL8f9ZN
	gyHYDZLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQ8K-00000006Nxs-06R8
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 19:29:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQ7J-00000006NgD-1rWt
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 19:28:54 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DE5iQv030297
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 19:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/5mhQy/iLi/hHQbqK1N//sXRK2hJJG0CiemfOAYFPXk=; b=AmoGWBEMTFYlYWwN
	vLzi4YKb+BKcOjAC07fN9B7ZQa6CTBZ0dM0Vc/GYA7wSnMXIyD9YFVHL/GQoddQY
	B5ioEhUdPQUff+puj6At++3IVRxt73xMSyN+DXiFAeBCVBirxKJ/gGqqFRmjShFp
	R3+Z8yNQ9LJSw8138W0cCwbXxNUYxVdlQUExLhBN6vZkVIYurXmlYr5i2iTQ+HZZ
	X4BRjyA7tnjEwfaTAZ9CdfcOKEiFMQh5YZKdy/bqzvhEp/BjeWD4VF7lKf8T+TEU
	nhK/aer0itq6jlCSwrHyQ8CL1gD4DrKJAfhkIcoraPTC7Q83kUgofax2oXYo60Hm
	t5eg4Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44549w8spu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 19:28:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21655569152so89047265ad.2
        for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 11:28:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736796531; x=1737401331;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/5mhQy/iLi/hHQbqK1N//sXRK2hJJG0CiemfOAYFPXk=;
        b=CvHnIWd94fal9XIWNq70cICTYazDwqm/9tk0SyxZYK601GfOUqyY+6sp7+DvPWUli/
         7PvbJmP8/4tZXdNFSpKxNNA1tv75bLXPwVlYkrnBRhfVtUbMMcF6HU1dPWGTk+A/HZgS
         VR0V8kj3UABhg2zBmfhdlPSBXpuHhoa0QTsTvlYKJv/fqwcLp1mO0bRw7K0xMK0rNGKu
         t1lKGWiNVyrIR0Zhd259XMUpR7nwSJvqym7uban+CyBKDSJ5IZ7NvMPTMohBav8tod36
         Vmv65IQiFiNkmH9lgVDRwTRSf03QJ4+5apDsN79GQQ7+ylsEBS92RiU+TO2XlSKzBmP5
         eZ1w==
X-Forwarded-Encrypted: i=1; AJvYcCV/RuKLV1hCEx7f6OnyhDElP+ucRQ0f9cIrcS3EzzD5qeP8jVvngVTOlSYtlexMAiE3st/6J5o=@lists.infradead.org
X-Gm-Message-State: AOJu0YxrohcwDt2xvXWNLxAzQMt+jpjNI40yVB4OMKjKg3ta3uhfRiu1
	0tSmsahtyufDFh0jYqVRRR6AGWsGjso7S8i0D8hXCYtndTR8pHSrOgyRA0w3ddPBzBZJNdWjqLL
	qrcvrsX72AEfDCWXTqOw0XopvGnYt0MZF9kbzKOCSmKOynvZ2S62n6wjgE9SyHTkPxKzA
X-Gm-Gg: ASbGncsgbjG0vsy7jW2JhwTzI9xzhT1JHEpNXpuPAM+1oEiD6PW+ImhRmMKgTarPbpg
	AG1EBcnaxzSaT26/q0nbpLasW947aIZcik+H35Y1XiQ1hNv86YZYLo5fw1G7GhHCh6CZ+jVmChu
	y6JorGgKh8TRLouB6sJf29EVAspbxPSniEAg066dvBKWkxAqvVkDy57aZNyIoWN5v2FNNzKwK43
	bcO+dnSK9zGJ3SjAZgqrUi12KwNG9+h/hy1W5DthsahtKgqS8hrZ8yE9T3Rk89p2hxvY5yIqZsS
	XN3RwvW+nLpSaImpLKjcrZ0zLk84yK2JnaECPJDwhi3QF+RaJg==
X-Received: by 2002:a17:902:da8d:b0:216:2abc:195c with SMTP id d9443c01a7336-21a83f429ecmr304262135ad.7.1736796530776;
        Mon, 13 Jan 2025 11:28:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFy8aD+OBjXqv32LcJQYeGJg+trdsFUduQg1qH1ESZhroKs+54HzfL+haMDzQ8DNywU/hIVRA==
X-Received: by 2002:a17:902:da8d:b0:216:2abc:195c with SMTP id d9443c01a7336-21a83f429ecmr304261755ad.7.1736796530351;
        Mon, 13 Jan 2025 11:28:50 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f253e02sm57279285ad.225.2025.01.13.11.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 11:28:50 -0800 (PST)
Message-ID: <b3f38056-b2af-4f11-af5b-e21d3426024b@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 11:28:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: Update HTT_TCL_METADATA version and bit
 mask definitions
To: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250109184932.1593157-1-quic_bmahalin@quicinc.com>
 <20250109184932.1593157-2-quic_bmahalin@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250109184932.1593157-2-quic_bmahalin@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lDyJP9Y4YUa1OxBv805yRkySwytD50Kd
X-Proofpoint-GUID: lDyJP9Y4YUa1OxBv805yRkySwytD50Kd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_112853_607515_9A74CD0B 
X-CRM114-Status: GOOD (  10.55  )
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

On 1/9/2025 10:49 AM, Balamurugan Mahalingam wrote:
> Update the HTT_TCL_METADATA version to the latest version (2)
> as the bit definitions have changed a little to support more
> features. This new version allows the host to submit a packet with
> more information to the firmware. Firmware uses this additional
> information to do special processing for certain frames.
> 
> All the firmware binaries available in upstream/public are compatible with
> this HTT version update.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>



