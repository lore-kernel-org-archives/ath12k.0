Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF67C55167
	for <ath12k@archiver.kernel.org>; Thu, 30 Jul 2026 12:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgJRwoX5jF9ieOOgTJUnCTZGa0j7I5rZMC3ubgqeQTU=; b=tTy0rfAMGdeDka3LrXiVBE4wYL
	9THLN+zuOoy0Uh1XNrPnZSXFyfj2xs1tAnzA0FCQsxGvcPm+GdqdeFB8ZZQGtink9ct9e0zlrA/oa
	1KwndXGkIno15EbFHMtmPpGpsrvZzZsfjJtg8l5HpCBTeDGbmY5HNUNkQpqJxlSQ0tVdLr/kYI03W
	87l856lKXVZ/l0q5wN+iaAfpTDHDSbjtdN/S36DxO7HsZw6XYLAVuJRQnlB1S7/T4GzMz/L/egFyc
	yuTaE4ta2LZTlzK8vAOQy/eJknxmoEv9YZzTWu+t2NoQkM8SD/s6bHNhn6PNsJkX6Gf138wq6RoMp
	GvRSNxzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQES-0000000AVxT-1x3l;
	Thu, 30 Jul 2026 12:51:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQEO-0000000AVwu-0vJQ
	for ath12k@lists.infradead.org;
	Thu, 30 Jul 2026 12:51:25 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UCmrdj1048926
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 12:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wgJRwoX5jF9ieOOgTJUnCTZGa0j7I5rZMC3ubgqeQTU=; b=Zhh1KuXlxoQvbDwc
	dHKo4c1IXabTrYA9fm3gQIaqNPTnnXD5lLyXvpkvrQ5qkRb9cZIR0kIHKSt+094s
	pjVogS8tL/oL+eEJGyUXzgle+2pB8PlAPXCipftstY0CqeXZX7jtS2SUpkn9ABY/
	0Dgj/tkg88y4/4JJxtpEr5sYBTb0RQ00TuL5Ej3iFoQ+ADBY/ZJHGS8o893jEoY4
	rAn2t9iEH+ozM/rcYFVG9v0IVGhnHkUigCRJlCJIKLJgODnGI6TJUlw4NTct8hgi
	8FeHCzofyMdf4cPxrOC8OIARIjGsbAVa3jXrGe6OIEyPfPvZYK7f43sBXEL8hNoC
	Acw34A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6xk00ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 12:51:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so3189818a91.0
        for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 05:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785415883; x=1786020683; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wgJRwoX5jF9ieOOgTJUnCTZGa0j7I5rZMC3ubgqeQTU=;
        b=bbkX5WeRBtRFNQxxIl8STOMlJGItJwgixV1++VjizBQ58N6KM44dhqAyvQgMiudm8W
         QLhDDZ/M0+B6tYPHtBfapke+zF85LojQ7jWz2ieq4tOh+vS/guxsOD+AsBTl4gBuJwOb
         m0nBGXZJCVIAMQ+g5DtX32++IvH3aClwt8DrjYI8YImej6CW+Xbo5JdWrJZ96nM0+kKh
         uTu27Sl+p2jGMcPh200YFLfvKzbpeDNfDarZJUKJ8G+LmO2BlFz9lZdh/9OO/6TP3HY7
         okh6v8NSl1o53kEyiAxe3z8Cvt7RXLuANeIfGVPEbTH27XOGrLeNWpCTuhroH/q8rj4l
         MsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785415883; x=1786020683;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wgJRwoX5jF9ieOOgTJUnCTZGa0j7I5rZMC3ubgqeQTU=;
        b=RfZA8pqE/VzV855Rkbcc28aSG5n02dWvnOXEh9RqqI03Uzx4rvOqkIAQEYwcrrLR7n
         NS6Yu4HWF+zFjBOYYWUshQak4Hlmqx1wySberO6B/vL6tQCJfqvBSl2LakZWVBNcvmZa
         ckFnahWHHaKd1T5WjDuACd8Po0VCMSD4cELdhaLO0h0xUrZUxMKzbHPN1f6Xh+pcERbJ
         4qlWmBLuskRzlrBWY7JOWJFTejgmVdifCaAMAn89h0pS8NiX8bx/4mBeQbUsaLbRFL8N
         qZuIKyDlwlfpXz6tCqjomZuDCEO09gndRE6anzcPrl+Wtj4icAj35ihYIFM/fwuPjpMB
         Dz6w==
X-Forwarded-Encrypted: i=1; AHgh+Ro3rmNgFxBaeIIDwT6TuZI4nA70oB3nipag1Zv8T7d0KFKfVjB4ImBw/9ToCyKUa+7QlF9PooY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwfD8RZPZaySek5Q5Xc6ZXoRn6ESi4Rk9r3OD5GD+1h0l6ryI21
	rZlheTzwBvwmdY7CwBjniKwG+5OiCUqDfq4Iiau8LbPEjOqGt/KzhJPlIJK+gAm2xDdVRKrYeDR
	oz0OE6P9veaxYBqSLNmCmDXaFvz5G/92rN/Ezr7z/FkptHHBnXF0IXvKOa9+u2MHe
X-Gm-Gg: AR+sD128jLcbFfPbyrf0kgmRui2skdEREja2a7wJNoOXf3yxL9ABcRiWs3ohOyK5UXz
	XEupevGBYoJfDKo/hxAgnbIDn74ibhn2EFxTbhE37xRl/93T2oeYdCmOQcuXq/JbOslzbDc5S7E
	XMEIR084JIKaTqA478hiNZ0/Uk7BqrbQ0NwaLadR7KibLF6fcuokSBpXoFmrxlUdUYS1OhnoFxl
	yqI/ocAoDhEWK7Ld26cQ/ZHQ8DPb0B215ixjV2b/jSzQLaCKTBX6wHI+TvnhZ4OrMewWtN7NUnn
	m8WED074O9K7lM2Y2ui8NN/ufZLfVezBYk9kEtAJ6zUp57neG+Ks5I0Zyc2SFkwhR6Pv2NdSnIE
	/VF0GuO5ZA1QpmWuVsSHayCG/Ji5ZTwPOVtt6N3ucNW78
X-Received: by 2002:a17:903:2ac4:b0:2ca:481:de45 with SMTP id d9443c01a7336-2d035bee380mr21485375ad.6.1785415883043;
        Thu, 30 Jul 2026 05:51:23 -0700 (PDT)
X-Received: by 2002:a17:903:2ac4:b0:2ca:481:de45 with SMTP id d9443c01a7336-2d035bee380mr21485115ad.6.1785415882518;
        Thu, 30 Jul 2026 05:51:22 -0700 (PDT)
Received: from [192.168.11.101] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc73b6sm20426776eec.18.2026.07.30.05.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 05:51:22 -0700 (PDT)
Message-ID: <a649a8b0-801a-452e-bc4c-fef153e07015@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:21:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: fix encrypted EAPOL TX in encap
 offload mode
To: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260729171732.668367-1-reshma.rajkumar@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260729171732.668367-1-reshma.rajkumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA5NiBTYWx0ZWRfXwL0bbcMN8Yk0
 xO5iUQaKxrgXGLhDx79/oSNr3i5y0ZSdUIaPZtsgrhQyzUQf0av4aRRg8RxP7gjwzKZ0/QNbwly
 64PjJ7osQG8xK69cJ8vm0l72lh2TlP4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA5NiBTYWx0ZWRfX+KrsJyNiaS0E
 ZPaJUyR7a4hNPQaXU8EO6KHl3t/BiMV33u/DYG1skz1gMJnV9sT1BA3Yu/7iem4l4ylVwpdyPPS
 +vZyhYxrNAKp5IaVksMUGb9GtpSWeAzRFZUVfzsfc47pSit7/d0PMvuJvbtY5jBFSgV5KT/i901
 RWqad1demOXEq6LQwBCki2ziqeKaBiCGTxzRDWvUJ610G5WAE+TIwa4xqeTnjThZyMty4h24oWL
 4zT/LXeswwiZJQVNZ1g2kAZXGV9cP3rLKlNwvJYwMgsh9kkz314eczsJh3czjWmmUuNPh1BLifd
 dXIUgQhXRxQBo0QXM/QaiLy1PEtq+pbFBZv9lolpaVmgAzFV1GN7be3QYuYtiLjvsadWuP3haYK
 up3W3Z7UAEZxWo87TRV+AkQNoHiDITuCksi7iZiJ7jQdne8nuW/SsGqfqK/ezNvVy5PKD5vfQQW
 yqvKBKwUhiWcYoQ90Ow==
X-Authority-Analysis: v=2.4 cv=ToPWQjXh c=1 sm=1 tr=0 ts=6a6b48cb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XimLFvTEBuXuzLDNtLAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: J0aUY5E75KweYLnn9Fl3J1nDCkg2x9oz
X-Proofpoint-ORIG-GUID: J0aUY5E75KweYLnn9Fl3J1nDCkg2x9oz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_055124_265782_A949E1FE 
X-CRM114-Status: GOOD (  12.56  )
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

On 7/29/2026 10:47 PM, Reshma Immaculate Rajkumar wrote:
> When a vif operates with IEEE80211_OFFLOAD_ENCAP_ENABLED,
> mac80211 delivers EAPOL frames to ath12k in native-WiFi format.
> 
> Unencrypted EAPOL frames used during the initial 4-way
> handshake are already handled through the existing
> is_diff_encap path. However, EAPOL frames transmitted during
> GTK rekeying carry ATH12K_SKB_CIPHER_SET and continue through
> the normal native-WiFi transmit path.
> 
> Firmware encryption requires RAW frames with cipher-specific IV and ICV
> fields correctly provisioned in the skb. Passing encrypted EAPOL frames
> in native-WiFi format results in incorrect IV provisioning, leading to
> an invalid ICV and frame drop.
> 
> Fix this by detecting the EAPOL frames that need HW encryption and
> converting them to firmware-encrypted RAW frames before transmission.
> Reserve IV space after the MAC header, append ICV space at the tail,
> select the appropriate firmware encryption type and request
> firmware-side encryption.
> 
> Introduce ath12k_dp_tx_crypto_iv_len() and ath12k_dp_tx_crypto_icv_len()
> helpers in the TX path to obtain cipher-specific IV and ICV lengths.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01270-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d29591d5b52e ("wifi: ath12k: Advertise encapsulation/decapsulation offload support to mac80211")
> Signed-off-by: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

