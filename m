Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F341E92FD5
	for <ath12k@archiver.kernel.org>; Mon, 29 Dec 2025 20:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpoZ5UGiip2J0KzaYSKkI3NnTZPsWCC7W/z4CEwTEwo=; b=TfejDiYGW5HXtCvDJ8EJapbqbN
	tzJb2BVYdLLqe/zAeuzI2RXg0lz/whKdZiVZ/e0bAxcdRtWY8fU9mQTBThph0s8rottnq9fUPHpyf
	z8klM6QePgmxfgS41R4m9F4va1Ouj3WLjB/UC8q7gUZNj8iJwhPpSykFcZBd9S2kvb9FXJ3tCCaU5
	Lb9d6BWMXrKbd3yafhdoKqvwH2z3Lie63RGxvgp2CI3IYdDYB6YLj2IwRIkpDTw67q4TI8v3MvxVK
	BQcILKj1M46RiY4GADOrkG54IYuZC2y64c5e4xq0BwWJQsWwXYxDfV3qYb0meCvSYZ9r1+g3he6Cf
	FG7CDdFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaJkW-000000042qO-0ZX8;
	Mon, 29 Dec 2025 20:21:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaJkT-000000042pf-2Lft
	for ath12k@lists.infradead.org;
	Mon, 29 Dec 2025 20:21:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BT9UUCl1243307
	for <ath12k@lists.infradead.org>; Mon, 29 Dec 2025 20:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dpoZ5UGiip2J0KzaYSKkI3NnTZPsWCC7W/z4CEwTEwo=; b=KlAdv2ubMWttmbER
	zK1m+HlhknlB9IltkrkURme8qcJDFJ+ZfDlbtrT4bO63ZP5p0yx+Yt8/PEmB7e22
	ahTfq8OgZvlgXY/Fsb8iq2Hnn0nKA7XFrPAgv5htE3T0qjnlfrTng8IXvQR38wtG
	dyS4TuVPF7yWnkc9+GkWwkgFnvdzpeOMNt3YbmgDgTpzxZ6IDNNMTu7cVEt0ApYd
	RQLEh2PAj9p1gENTP3jl3g3yILavYaUsbAem52ycezS2xmen9DpZqC0OGQFJUvui
	8gdV093GMKBOXuEyX5EfYy6KfwRshLAHXVDpYwIjScRmISHmwSoBA6hGexuUMRA1
	OFlloA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bavrj3sxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 29 Dec 2025 20:21:48 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-11ddcc9f85eso18264836c88.0
        for <ath12k@lists.infradead.org>; Mon, 29 Dec 2025 12:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767039708; x=1767644508; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dpoZ5UGiip2J0KzaYSKkI3NnTZPsWCC7W/z4CEwTEwo=;
        b=LvoAROSBR/HFHenVfjskV1WYnTrz++qOlg1tDjALVhgtXqh8QY4G2g8QebWRdH49s4
         mpWNqJDIzXG5Yy80lhpQUhECoQF0gQhODcTzwQTk38eWxsl1BD6ESAKshP3HJjmh8+As
         dGwY06ZyBBPvgVQNArSYJY7lzaad54u7AuOp0BIAIKiU3hVieYr4JcoKQqAFyXEtBFpQ
         ly4t6zeEPCstKJxUhxkbRpZU1lUUGQHMjfOmRN+GKAEJyyq8JInSmw/VDbhe8GYGyN3g
         sPDpxi8AVEGsIPfjWi7J9M7h0jGXDCi/bx956eo5xKDuSprB/6IRkBbW45bRe6rL5kTa
         WSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767039708; x=1767644508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dpoZ5UGiip2J0KzaYSKkI3NnTZPsWCC7W/z4CEwTEwo=;
        b=YuEPIGf2rnQ8DbhDAA3uVki43mn065jIpFw4i2zPzs8NY6uAfmDM7TZs+JlLEx3cO0
         iyaKYgjSZH+zEVLos329yT0m6MumoVbE/OmIQi8BUd3YNorjNBN4c18tuEfSbGyuTMBx
         3dAo6wzf+NdoQ2wBeDp67hnA3WzCuemdpMt8OGl8+Z4Wtz+zh2NfLVyj9nUWUyQGe+Zd
         FO1GlD+kDbw4CZXvyyEw2oDYGAjHzovNwVrpvZal6+4sbPj1vpyHeGce0anZlh0jRp38
         h77+KIhVlGLrWiIDq3u2bhlscbqxg1+f+WnNnrg9IBUKbd+qhQvmvBHQUqZSpbDkiZMC
         Aqmg==
X-Forwarded-Encrypted: i=1; AJvYcCVTSlgXCEc27kwKwFsg/t+PXFmErtRjNse8yV0mgsce2SHeyvXAqZPB+1bhfZ8qqj9Iahrs5gY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxVjpEKNIdcUVh9DkK02ONjCOw6osTgwY9uoKSl0/B8ctBz2GTi
	0qkQqcXyQIYjfXowfa6IKXt/+mvzcNYrWCtkNLuwbCAxp/g2sTUKSrj/I/2c+CMKmQS35QO/waW
	HOHl8EYEAb+dVNZILiit0vq4KhVPnpVIDaa6M5OVQnTthbny6228UQerKOUpUACIL
X-Gm-Gg: AY/fxX5wIh2050tOxb1kt53kmww5yJYaF0xB3+jGGkKxUyvpeIl8/3B3MfXuBH2bSja
	ZvHnTqUSQUJFBcXE3+13bBLjusR34KEC0Ycr0eeDIdACbNv9Ih78xkRV1syHzOVL6Nj6lyP0BM/
	lq8N4oa4esM0G73i0A0SbHM96kPjzatQr2R+57nKRB+JKopInqoWFpILuaI468qkGPidLNp/yS2
	wIfeJdWCRL/hlN3u9hNTsGe9qYwXOLCyagHfktaxlJ8Q20e3CrRQsioudDrDzx//I9+NQpuZIPY
	ySX81cqnVLplq5myrNewJV+LxnDQFDFF4lJKWX2GteNrOwJ8KTiCc6w4lhIy1UCJqZ8wBtRWP1l
	s5+NbsM86h7kUov7uUrlNZex85Q3xNfnDV/6ZCrQWSt0Obj64R2qN9n+0IvKxvdQ=
X-Received: by 2002:a05:7022:204:b0:11f:19f9:c5f9 with SMTP id a92af1059eb24-12171aca672mr31221580c88.12.1767039708187;
        Mon, 29 Dec 2025 12:21:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETQHo90sIZ9Ah2oFCPURRgJ6JOFVSXKLGKjyL2O2wo5JOl3Bs3GTMtBAiIr30Ft0lRKlNsqA==
X-Received: by 2002:a05:7022:204:b0:11f:19f9:c5f9 with SMTP id a92af1059eb24-12171aca672mr31221563c88.12.1767039707617;
        Mon, 29 Dec 2025 12:21:47 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm120318362c88.5.2025.12.29.12.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 12:21:47 -0800 (PST)
Message-ID: <9e6d2c54-6c63-4cb9-933b-3647c25fe72d@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 13:21:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] bus: mhi: host: Drop the auto_queue support
To: manivannan.sadhasivam@oss.qualcomm.com,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Maxim Kochetkov <fido_max@inbox.ru>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>, Chris Lew <quic_clew@quicinc.com>
References: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
 <20251218-qrtr-fix-v2-2-c7499bfcfbe0@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251218-qrtr-fix-v2-2-c7499bfcfbe0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 32_htKPNexkNmvtOZ0bBqfiubJ5ROFUl
X-Proofpoint-GUID: 32_htKPNexkNmvtOZ0bBqfiubJ5ROFUl
X-Authority-Analysis: v=2.4 cv=coiWUl4i c=1 sm=1 tr=0 ts=6952e2dd cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gPICEALkPRU_h5exja4A:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDE4NiBTYWx0ZWRfX2hJs/o+Wt4JR
 Y7V1jY7a1fdNZN+WATWkwyCDokF0ViRHUYglNWrKIj9EiHv4Ze6woPMFUvbBZeozXw8DcE6eg76
 XKmyEMDc0sVJbOo6+a9519M5eoEvv579lFMx/UKwovZM/mYnWjd/nJlvd77O47KMMH5db1jmBhS
 3yJku/kynWsbq/hBLFtJJppS8tnbIytUtaFSHcfcCnd349/O1qRYXv8GMdfm2BY1lmFMvat4uQi
 aDAOt382VNKHgwJzHstFOhbdjvBdWCJE7uM3NX8ObS+ITFMlz51ypBaUYhNAX6339tUlfRgKpgX
 n/+byZObxeu+4AmiRLAunLfSMjomJODF0lHnVLWam29OQuoMpCOqp9Ee38kTgyBavmEf+2Rt5Za
 jHu/F1L/Iqy7fYM41/883YQMsuk5gjD22xac0UJa9+GEHx1zCsb6nMb2i922v1u9ESOotfMo62H
 N+iTLh6lfkMS29rYiRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_06,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_122149_608546_E2E7CD48 
X-CRM114-Status: GOOD (  10.42  )
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

On 12/18/2025 9:51 AM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Now that the only user of the 'auto_queue' feature, (QRTR) has been
> converted to manage the buffers on its own, drop the code related to it.
> 
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

