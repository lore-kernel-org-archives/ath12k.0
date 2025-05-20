Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C276C3ABDD
	for <ath12k@archiver.kernel.org>; Tue, 20 May 2025 05:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wlt3Fp0JW7EstEEKwfVT1fU4hBSzC86YFZZPKTQMnI0=; b=J2C8RGV5p1XP2dcBodZIe3UwxB
	MgbpSvGxj3FRRbE/5FdgY591ICHXf3UVIyedBGSV+KboMiB0tXndY7hxZ58iZyLux3HCt3ShtAfOh
	Rjs1qr9nYNw5z2jKQS5HhOf5sg7AFv09tDY/qDX06rkwOevS9u8KQwHQPX28sc5YXnzsIcWnQIfBq
	jWI8Vt/xKdqCPFPQnhTewVG8AOSRLS53jy5INX2B1omLIVPOJcLoIZU/xI8ftV5laA5KiCRuHe3FD
	UYjE/3+3KAXflo6KLpRB5AzMn8LGHzSRsQEkMTl6eEy7VRETUUxkzCxKxzK1BOmOxa46PO+QINzoZ
	1131ekBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHFU8-0000000BZkp-1Hw8;
	Tue, 20 May 2025 05:25:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHFU5-0000000BZjq-3xSj
	for ath12k@lists.infradead.org;
	Tue, 20 May 2025 05:25:51 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K2JCdK028704
	for <ath12k@lists.infradead.org>; Tue, 20 May 2025 05:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wlt3Fp0JW7EstEEKwfVT1fU4hBSzC86YFZZPKTQMnI0=; b=gMDu8y50Jc9yM1b+
	t+E/HWb+MBu7ivwEDtpR7sB7qfhbSVdpLp02rJXqJCpE2acqWeNGbGXuYQ/+Zeh6
	CMVaIMfKGOBtfgIWNJHtgV72+jC5mLDB5nsewhjqqr69WYQ8lIUy27E4LbOT0y9B
	Wp9QsyGYakB2mrJ32d+QvbjkCBQ0lurpg6deN+rjOZCs5Kp0vbmZfN7PLS4eo+Xa
	jyOdfSfZ/Czo/9rgavW7uyo3IYkJJdbAHpGhWoaC73uHXbEfkrb0bKME7mE5cWkU
	AU3w2CZhUehjABQ8L3akpryiobfjeGBKOrlc2SwVmF4fKsJcDXyFiSY9rtYoZ3gp
	KF2uxg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7ejug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 20 May 2025 05:25:47 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b26db9af463so5029036a12.2
        for <ath12k@lists.infradead.org>; Mon, 19 May 2025 22:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747718746; x=1748323546;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wlt3Fp0JW7EstEEKwfVT1fU4hBSzC86YFZZPKTQMnI0=;
        b=sGCuyxqQoEL/cCTyRgN7M/TRnIJ0hb/29I4RhKDcrzb9iEX2TD+Tdgzzf+8qQmhyBh
         gbwMZyQ5m0wu7sKoS3FsOE2fLebVDPAHcbSiMdo8X3mmqadXWHfV+Y6s/6r7nobEs76U
         en+US6vK6U58cMoELutvO4r1fnVWyZwlzfDjhoq7sQE1XiSZHs2zHVTLEsf82UeedV7f
         D/cDEvbdDAwIpnPgYidOMCP1iqXbDwhosqBTkQ7nbHUOzzHIXthUag97JYU7vrFfGdoo
         zORl6xt17qkGSNZ2zZmduCQ0dIb1J0ov4R4pZ0FXaLkVDKX9GDzpgmMKmZQDMZADApzG
         8EfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ0g+cNYo+w7/mmoIEYOROXFGr4BuvNoAxzZXAZuL2d5CmheK5frewPYaXg9rM6Z/7nvP86AE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyFM/9gVFq6UK6e7pkz1NUKcxLnr/QRssPHmaUboeRXM9oAL0r8
	xjrERiurgYN6NFU24cu3WeM4D5vi4MZYAhwd9v6FDjK6y/sehce+sjz17nprF2SkZyUyoxIDYJN
	ejJsdHeS92peKlxxFqdE8bEs/5rH+3PKBd8gekBnjVBbZ4Y0Qy3btM3/kaxCD4hkiTEt9KoTU
X-Gm-Gg: ASbGncsnVMlcvpaAzjr12LDLaxd5byu85IiFB1LxFKiExMfHDYp2BljIzm8W+UDIxE1
	6+OAQkenMyoe6lbCXytchXgrsAO1LXt1lVNtJ8cG83j95VjZfGg/gc66qXFDABhlQWGRbpuvCf+
	ErOnYedCC7VjScSVwe9ad8XhnMZ+cMc1Eq1XrT7lyR7nNWo5FFBJLZ9EfHEU4JfxZZCv+VzZiVE
	b3yHCP8PTroiIBNbPlQdkD06eXhWZh6KY5n06qs2ncuOjbugKXLp1X0+65D8NMLCrMSxUrt+yWE
	89RSk4ggORTyMNHJixNU+558eT5cPD5Z5VX85pXleUjZcgonXFj8hSCYuCSd
X-Received: by 2002:a17:902:f64f:b0:223:26da:4b6f with SMTP id d9443c01a7336-231d43a479amr243153615ad.14.1747718745997;
        Mon, 19 May 2025 22:25:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhicgIUkUlCk/ZP6SHXT4Yi37KIJ4JVpqAQQQeDzR9WBY4IywvHL5dB59fYn41o/WiUvpUNA==
X-Received: by 2002:a17:902:f64f:b0:223:26da:4b6f with SMTP id d9443c01a7336-231d43a479amr243153375ad.14.1747718745660;
        Mon, 19 May 2025 22:25:45 -0700 (PDT)
Received: from [192.168.225.142] ([157.51.197.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac99f4sm68842115ad.23.2025.05.19.22.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 22:25:45 -0700 (PDT)
Message-ID: <deb386d7-2ace-aa83-4e44-742102e2e0fd@oss.qualcomm.com>
Date: Tue, 20 May 2025 10:55:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: fix mac pdev frequency range
 update
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Rajat Soni <quic_rajson@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250520-fix_freq_range_update-v1-1-e061fd147b87@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250520-fix_freq_range_update-v1-1-e061fd147b87@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682c125b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=4yAOwc62Quh7N6Ih8RcKWg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=VeykXRrYc7WjYsKDlBgA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=ZXulRonScM0A:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: PS_ENRLlJ6_7s05V-ShGHkOdIjp5KYSS
X-Proofpoint-GUID: PS_ENRLlJ6_7s05V-ShGHkOdIjp5KYSS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA0MiBTYWx0ZWRfX8enyzMjaqwpQ
 PsCSxKpTzC9fP37nJcpRe2KyDmohjFweAouBtvh4n2JEfVUoK6dRks6N4j04Ow7aE9yD1697Z4x
 rZrRaVdTFGTG/N1eAPvb7oyTOH9qdnT87oEmLffrT6rT4TjzDiVbkEv0eD3LzR1Q4oSEi4IB4iU
 vdHy57k59slPMPFplZF6XsyDE7G6uknlf3N2OeIRRQplmrvPCpwA4OZkL4NwRMicrDRehPZqAxL
 +ZQEZblXr7P6oMga2oCkOEOu3e0xcig8bFWI64axiLHnN7MIxJxbbQ7C+P26EXRQ6qUo2pPm7g8
 WXvV7tbcU6bZX3rSt9sYAJBshp0hNS7EzVfuBFU/9XijAhqjVaVRn27EWSjAawzgCTuDy0at2mC
 fqSwK91ZinKNHRbskRFlOMpsE/ummvBkXpJk8wfN2a24erUuuQmUR9vVLtb1XnAC21iU+H3A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=805 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_222550_115914_2AFD880E 
X-CRM114-Status: GOOD (  12.31  )
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



On 5/20/2025 10:06 AM, Aditya Kumar Singh wrote:
> The current implementation of per-pdev frequency range updates assumes that
> each pdev supports only a single band. As a result in ath12k_regd_update(),
> bands are handled using an if-else structure, which limits updates to only
> one of the band per pdev. This assumption does not hold for all chipsets.
> For example, the WCN7850 supports multiple bands within a single pdev.
> 
> Hence to accommodate such cases, update the logic to account for all band
> cases by handling each band in a separate if conditions instead of the
> previous if-else structure.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 13324cecbb2c ("wifi: ath12k: Update frequency range if reg rules changes")
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

