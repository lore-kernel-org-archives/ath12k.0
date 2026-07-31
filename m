Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713F2C5516D
	for <ath12k@archiver.kernel.org>; Fri, 31 Jul 2026 08:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YuohLgv2ewEMxWehRE3OJp4yXClrJcRe5nvz3u5mbkw=; b=UVyQphxFPcFZFsSBVgQIh6Ccms
	Hqwz0hozdLz4yIonAZRZ3r0YOBF6/jtN4nzn7uE+KQUioba0VrqHYunc8IhYN5+OH7ERf2PB4IBJB
	EJDgDuaMvTFcYW+4KcgZFSPj4Fb3PPSOvDh9pwR6aHdz5IpR07w4RC7KNODnqlDLCy+e3lZWhehu1
	+VUvZJ8ZXxBM45Sny0wXHM24VoAQdNmYiaILCwBRJi0p8Q1/l+Lkq+3XvMFERdH6iJPXQDlh5+Uzt
	+Gt0muhZHGk/34NdDFR4qJwx2tlSaTIBHLQcMT9g34uLomxNS7cooZjk6jruaJiRerh0N/tF6uGiF
	0I5r6fQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpivK-0000000C6lP-0bkE;
	Fri, 31 Jul 2026 08:48:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpivF-0000000C6jn-45rC
	for ath12k@lists.infradead.org;
	Fri, 31 Jul 2026 08:48:56 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8c0uA480279
	for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 08:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YuohLgv2ewEMxWehRE3OJp4yXClrJcRe5nvz3u5mbkw=; b=GCupiym08Ro3L1vA
	y+aaawzkdT4YtUjsdKw//xK+zyCA1AkSObg0w9XN0wUNmMEWDQP9/oZDf0iJ1Cuy
	Zn4Yx7QtqnUrgR5giYckvAUAQ4NAQoAgrQylpScr/AVP98+iqDOa+XcLo4J1/czG
	kYbLxI6lyXXRnlF1n0/GHQEdcnnqgjoTTBsTLpMs3GvzeqaoO3sRXIY4UUZk73OT
	q7j5niPs8vMk//XFItZKxz9+ltNe3QQU9bNw3yCbCBVVcCmoj5qLEfv6hFt1Bz+E
	pMiJBaE6aXuz2MZ6mYH54QIg2whu3932+YubrUCfNDhSSfqNQgVaBCwkNgedNS7n
	mATsdg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frrc8g1e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 08:48:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d001671a54so15425145ad.2
        for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 01:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785487733; x=1786092533; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YuohLgv2ewEMxWehRE3OJp4yXClrJcRe5nvz3u5mbkw=;
        b=KQ8zgJIDuHDRiy7O3/oVtNDrhIQvvCLKllo7HMlpaUrzqAGqQ6xXSem3PkbW7tRr4S
         Ck/5fVYwmihOXJujKACi3aIbnRtBDLs3kKa1qBPL5lyM3UA9vf4d+//4VTR61Qh6RZNY
         fZOU/Is70/3v4cBVUmrrJlsnQVw1x3vcyFCZ3MTWcizhnOcCER/k6ptu/M5bQkpam/TM
         OS6r6ZwH9aPyieItDKRmxswuPLGQuzcKkH8uyjXnvmATnrjYMtL26IqrMOoVb7pTPiRh
         kN16WCiumVLcVUqNMthOkJLUJkpR0hpDpvg1lyBF+8uPwP6nf3UUavZ42ziXzoyq6n88
         LNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785487733; x=1786092533;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YuohLgv2ewEMxWehRE3OJp4yXClrJcRe5nvz3u5mbkw=;
        b=LaVVzw6VPaDVuEx13hLlyD6cykgukhk1JCDR+ewizH0pypU2zjZ/GCOPxKBOO2zFAx
         9/rhj7AS4rq+GFd2HgccMVzJPcgDwXd4JeNBtmaplx4ig+S2UZQZp1I7SXMlRrVp0zkj
         BimzEu5nke4g9+aM9Cx7+3ezo7OlAbbrQhxeojgClSmsGJscHEWgR3qicH39E5l0kRgk
         xK4RnDh1w80ej+m3UlYQGifs0lSPfwAlPag0zHFAHUUi4g8npiOWEtKJzD9pPlEEIxYr
         NTqGDE/ZxvtfmZWtPOimqBwn4rvdw1tdv4cG+1x8IQVMFLpG9Vc3OqnheXPhqbgwhoUt
         litw==
X-Forwarded-Encrypted: i=1; AHgh+RpjcL4+tPu7frLOUhuru1FySjUGLPfH0SlSGufY7MQTYa1Xb/TmCYjNkD/MwH0RpWk5Is8bhuA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxEaSw1vDwJMF7G3oWbTIVuDlbaxUdzbYmxvLrc/p/UdXQM0XMF
	85QsQOcLrC+pE3PqLPCVHzF8TnStD+uU6bAHQ446AA2nOSxXuMVZIw5gU2MmS2J9uhhqRMM4s+0
	wfMSEOn7C9gjR6iEYxKwKBFE+W4xT08WDkHHbj/++/gxUuc0v5tHVP3cR3QO0XuYE
X-Gm-Gg: AR+sD106zFyGW82VnkKZUJ6BgbKDoIMzzZ/RFO6z8089cf1JXNvLEn8gVT9jMfyhJme
	1OKQ42K5QORr4XZ2In4/9wWfQ+8yQAKEWWFM84WO79zBTa34Nx89LpHoxxNYmhXkgwBq36fy4yy
	8DVUn0R+uLKFwQNuZ/FRXea4U9kAb8/RKsteLz+OrjZiyoLzORnMiFzyA733YC8IwGf+z4hxLjr
	wvyKSPRlLqunyISQun3xKusxnXQCjlLwxjgT+mBgYA04nZxMh47wK0zageH7j8E4W8rhUpezf12
	4iFD1gygX5aZ8azk8PxW4xcoK2geLj2joq25xBXXbcygLN7SMwCaVCzmBK116F3+LPsR2n/DcbE
	aIE7eunZhWwDL+Wok33LDKR6c8SraVef7oZ7NjgwYYfmxHxbp8qP5DeNMaQ+N04122kZOs0mpww
	==
X-Received: by 2002:a17:903:2f4c:b0:2be:3850:297e with SMTP id d9443c01a7336-2d046e7db1emr13839445ad.31.1785487732763;
        Fri, 31 Jul 2026 01:48:52 -0700 (PDT)
X-Received: by 2002:a17:903:2f4c:b0:2be:3850:297e with SMTP id d9443c01a7336-2d046e7db1emr13839105ad.31.1785487732202;
        Fri, 31 Jul 2026 01:48:52 -0700 (PDT)
Received: from [10.133.33.123] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae68cf7sm2700115ad.31.2026.07.31.01.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 01:48:51 -0700 (PDT)
Message-ID: <1f80cdf0-2ca8-4b28-9192-b42bd61abff1@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:48:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] wifi: ath12k: skip connection_loss_work for MLO
 beacon miss
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260727162748.963275-1-jtornosm@redhat.com>
 <20260727162748.963275-6-jtornosm@redhat.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260727162748.963275-6-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CmZEmAWbLWd6HDT-wFxzEyMAfSU4JzlL
X-Proofpoint-ORIG-GUID: CmZEmAWbLWd6HDT-wFxzEyMAfSU4JzlL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2MyBTYWx0ZWRfX0SSYjtEUIa4q
 yKp1psFLw0oF8HwBiC8RC7gJglPmEtboAP0ZSnyBKutsJVnB+EHC8DepTKSX+PODk5CD+4pS2dS
 HecCKpdxB/OYaNOM1iRk/ZINt0U5ww2yeN1xYEkU2uF42HoqSMIfdJ3ApBK0su24VChinE5sZ4O
 wbFa5SGG+rOHQ2TESoU/tX81uTzCDyNagzBIZAC6PVJlDi0rnfUB5t1h1uhRaMSAE8fdc1Hvjb1
 0bc1+sKSoxLyIjPYyu+Ce6s914daJEszCJxQwVSyLa+HjDd6SHSinIqZ0g2Vm5WuJjaCwn7rD8r
 9szYYqKROqpdb+IxC5FakLJHnMhVNvVvf/IqzIWCuB/6FRi70bOFK0Pj2uUDrMS5y4RoEMZbvEW
 83nWfYpSlq8L4QUEOxEZkXJFKcjz9uzA42tm81mB3pLk1rBaGR4JudhSJZeuXFyumzs5nlXdbRV
 hHHzYu/zZYGJh4Y9nQQ==
X-Authority-Analysis: v=2.4 cv=EcL4hvmC c=1 sm=1 tr=0 ts=6a6c6175 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=20KFwNOVAAAA:8 a=Mojy9TJRF7p0t743WAkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2MyBTYWx0ZWRfX1eU1sb5WQ6Gz
 p6nEwwalFY/3/LqDDTHwNA/ugMPiUpcU6QQvcIzAR6ghGAIIsMJWMQHG2jyo/1rrMRMCGArAYcL
 oz8oi2Pazt5Tka4g2y6tXymiBLggOcs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_014854_027863_2D2257EA 
X-CRM114-Status: GOOD (  20.33  )
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



On 7/28/2026 12:27 AM, Jose Ignacio Tornos Martinez wrote:
> When firmware reports a beacon miss, ath12k queues connection_loss_work
> as a 3-second backup timer that forces a full VIF disconnect via
> ieee80211_connection_loss(). This work can only be cancelled when a
> beacon frame arrives through WMI in ath12k_mac_handle_beacon_iter().
> 
> In MLO, this mechanism causes periodic spurious disconnections because
> the firmware does not reliably forward beacon frames to the host via
> WMI, making the cancellation path ineffective. The result is a full
> VIF disconnect every ~16 seconds during normal MLO operation, easily
> reproducible under heavy traffic.
> 
> Skip queueing connection_loss_work for MLO VIFs. The mac80211 AP probe
> triggered by ieee80211_beacon_loss() is sufficient to detect real AP
> unreachability. Other MLO-capable drivers such as mt76 and rtw89
> similarly rely on ieee80211_beacon_loss() without adding a backup
> disconnect timer.
> 
> Tested on WCN7850 with MLO (Wi-Fi 7).
> 
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index af09153ad9d9..dfd69822c5ce 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -2008,9 +2008,16 @@ void ath12k_mac_handle_beacon_miss(struct ath12k *ar,
>  	 * (done by mac80211) succeeds but beacons do not resume then it
>  	 * doesn't make sense to continue operation. Queue connection loss work
>  	 * which can be cancelled when beacon is received.
> +	 *
> +	 * Skip for MLO because connection_loss_work disconnects the entire
> +	 * VIF based on a single link's beacon miss, and its cancellation
> +	 * mechanism (beacon reception via WMI) is unreliable. The mac80211
> +	 * probe triggered by ieee80211_beacon_loss() above is sufficient
> +	 * to detect real AP unreachability.
>  	 */
> -	ieee80211_queue_delayed_work(hw, &arvif->connection_loss_work,
> -				     ATH12K_CONNECTION_LOSS_HZ);
> +	if (!ieee80211_vif_is_mld(vif))
> +		ieee80211_queue_delayed_work(hw, &arvif->connection_loss_work,
> +					     ATH12K_CONNECTION_LOSS_HZ);

with this, patch 4/5's MLO branch is never reachable

>  }
>  
>  static void ath12k_mac_vif_sta_connection_loss_work(struct work_struct *work)


