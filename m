Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BECC3ABBC
	for <ath12k@archiver.kernel.org>; Mon,  5 May 2025 17:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gc8xK7MUaegQ4Hd1zIE2N7VWBlBkfEVs+amTpWNe2X8=; b=m8Rw0E9BFdc5vxDs/x9jn8DbOk
	eoDQDbvLpo8el+/2WKcxSIbUs0+4OzmU1IAbe/Bl9LV+BSqjmULOyV8joZ14Rx0nYWod53B2Ux+vf
	5pjf7noChCsjL1kZ3TAufis4yWNXMNs91HDNwnFixPVPgEf85ETLdIokIK9gBf6txX1MfZsJiP6uK
	hEuHGwXEcPZ10cCmYs0h6pVumJAWOcs5jadjolCQNvdszHymQxEiZoSJejiFQHHtcrBt9Y+JeENf/
	Br9D1nJnW2PSiKqtZCe9k9P7NIHE3Wv0lGHZB8vtW4g09NWPK1C4P1Fa5fsVC8qr9VMLbrY+YYT4Q
	ap9FHPnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC030-00000008EJj-0Z6I;
	Mon, 05 May 2025 17:56:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBzu3-00000008Czc-4BgZ
	for ath12k@lists.infradead.org;
	Mon, 05 May 2025 17:46:57 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545CGSMl001685
	for <ath12k@lists.infradead.org>; Mon, 5 May 2025 17:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gc8xK7MUaegQ4Hd1zIE2N7VWBlBkfEVs+amTpWNe2X8=; b=IyQbVtESVCED85bc
	0o159F2/I6eCiRbpmmRSLFFcGOPMIQC4U0uTXBeP4b3ucBygj5v8Wh9cvwSj3Oz4
	uVe50o+c9GvzHk3N/3qnW1Ifi3oZscxgBJPShD6TAPJmw69tGPGYV4N8jL9fShAr
	1TG7XklVVBV7nOUcq1hFGlanDTnb2sy2wxVddYYCkew7M/WleXVPFiyUxpqJAslQ
	qSvGPv079bYRzjT67U/poGCB5kcnGsHm833e3sEq1juCYOz3ry1ovk1XfpF/Luey
	AM5WkJcSa6I0Gann/klPn5YfOJ89AeliJVPXEknE+cnDW+BdzddwieRwEs5oZsar
	i8oz+Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rvvkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 05 May 2025 17:46:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-afd1e7f52f7so2474968a12.1
        for <ath12k@lists.infradead.org>; Mon, 05 May 2025 10:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746467213; x=1747072013;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gc8xK7MUaegQ4Hd1zIE2N7VWBlBkfEVs+amTpWNe2X8=;
        b=wPUT0i1e0KLva1J9r0CXyH96pLqOBpiUak4okYe0DND/BoKhsrsIU+F/5O/in0/RYy
         gW7GCxq5zfFxrpdHCCOI7kLEedPX+yYcsiL0QfKEMwa81WNPLv9u5ycJdoaqpMlKMzYO
         ex5R9FEtNUatQFVCwDjnIFBoqZbc4U27VC+Mm2cOvq7rj/TQsfBHVzCUWEj12JjdGpGY
         rnPOOhL6JaL+KLzZj61r8SEvS+NNcZXNPd55IdI6gXBH0akImYEZzz+vL8wFFyOYKro3
         OfudUlG+mf5pke3pUGkOZSULKdXbYj2Hus0DO0ccDT9LZBHNYXW8KqOxmaBqETTJ/CL1
         e2hw==
X-Forwarded-Encrypted: i=1; AJvYcCVTHzP+FA3l7Ddm93sMuFzrs9TATagTxMGmZ8K5G9VY6hMw4PMRPgrKhX5snLOe3hWnqXzViz0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx571XHgvW7F5zE+myHoP8GCdWxF6aGAFfxB2HKJooUrlR+W0Yj
	/ugWp3Qlb9EHXR0BJm3YtUQkkngjiiF1mJ8mCkr39nTPc80z5HxR8yGPzZEuP1ax5QohWYDljwe
	XLVbajnd1L9ETHOU6yipa+zPkM+HOA/wI3G/Kq84AMHuFlo27eoqZDVgX9iQm
X-Gm-Gg: ASbGncsHX6Ev/4bqR5WEMujYoQy+NFbx0qgaepWU9st44/zDj3l+9QYzinGQNGic9F+
	Sa0EBCWZX+30OfcB9lKpmUWiLn9Pzq8nm2PYKq1LsINrD7ObMSgCRJwuCbjTmDzmBNJmbl+tJQD
	swHLe6kKNqQXsHqhgWc8oi4mk76FAs5OA4MA9pP5Df88ARfB9jNv4nkg4Mlvq+81fWocasTH3m9
	iJiUSPOs6reQAkMsl+7DbekaWbmV/URCQNcB1vl/KOa2xyHuDAKzhWfuvztgWP+07SwkjGhwBq+
	w8obHhYvGHapj4LmyN4rH00tnguVTUt6ERcRus89y6Klj9VeA5pb+SLh2daXLLU9Xo8=
X-Received: by 2002:a05:6a20:43a1:b0:201:8a13:f392 with SMTP id adf61e73a8af0-21181146f0cmr49160637.20.1746467213354;
        Mon, 05 May 2025 10:46:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNurxKi73dxQdNRKjVd5IgfE8FJGdhrSPwkrS9BHFQeVceJ4PrtyFTQw5d58wQk/Q8BTJEmg==
X-Received: by 2002:a05:6a20:43a1:b0:201:8a13:f392 with SMTP id adf61e73a8af0-21181146f0cmr49135637.20.1746467212931;
        Mon, 05 May 2025 10:46:52 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3b7c309sm5782394a12.38.2025.05.05.10.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 10:46:52 -0700 (PDT)
Message-ID: <5fcbf500-8005-403c-a9db-597fb8a54bc1@oss.qualcomm.com>
Date: Mon, 5 May 2025 10:46:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: disable pdev for non supported
 country
To: Muna Sinada <muna.sinada@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Karthik M <quic_karm@quicinc.com>
References: <20250502230240.3692678-1-muna.sinada@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250502230240.3692678-1-muna.sinada@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tI6TzEhCv5j2I-2rINjWZsYrXQmvDDx5
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=6818f98e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=zEEqOW7EwutULFlLG24A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tI6TzEhCv5j2I-2rINjWZsYrXQmvDDx5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDE2NyBTYWx0ZWRfX7TNtuW3GxNfz
 LEi4EJX2FYZKKdfPpBj7kbqM6HgAq83S/WEUuo9DCSTFBXpHxL4ixfSra/tl6xrPaRxz5VvUUq6
 FXOfpvFkxH27xgqCVtpGcL0piZr7J7n+Eba2tEEtOoyHWDKMQ6mojTZEgTf+PGBIENtLfCHZP/Q
 oZ8+MnhPYU/n28zZ2YffHBrxOmUATdlk6tde8B2TUTS9CO6WEqosIOqp2XlZTkAHwB+Y43Sekb5
 G+SWEdDYiAtDUm4EGoiqjHk1pBauqU+iqo/ZPknX2ObxIx7mexjQNSqjJJiLHPNs1/YnMuRZewO
 8++y15xIeD7zev7+7XKF3uTJC5cdJYUHuXOPs5vg/SJUo7eFPaf746qcRZOj0wxHqNULUYcIkkV
 LQJQc6ENsStmP2M7m2M4KuXanC85WAm0vceWFrq+LvaaqlN0Iv4Y0TvHSF7VMl7sDuXNBZIo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_08,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=654
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_104656_064434_39F0F755 
X-CRM114-Status: GOOD (  13.54  )
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

On 5/2/2025 4:02 PM, Muna Sinada wrote:
> From: Karthik M <quic_karm@quicinc.com>
> 
> In MLO configuration, ath12k_mac_radio_start() iterates through all
> the radios and makes the ar state 'ON'. Even though some bands are
> not supported in certain countries, ath12k_reg_update_chan_list()
> tries to update the channel list for all the active pdevs and ends
> up in the warn_on for non-supported band.
> 
> To prevent this, disable the pdev when the num of channels in a band

s/num/number/

> for a particular country is zero.

Can you explain what is meant by disabling the pdev? There are plenty of
countries where not all bands are supported, but I'd expect the pdev to be
active on the bands that are supported.

Or is it more accurate to say:
disable the pdev when the number of channels across all bands supported by the
pdev is zero for a particular country?

I just want to make sure the description is accurate.

/jeff

