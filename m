Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97142C5516D
	for <ath12k@archiver.kernel.org>; Fri, 31 Jul 2026 14:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GF6NjZywMQ/+If4HtsLfht1L4cnQsWslI7k4bzhHTMY=; b=iuKCwPxyKH/tmx0GxkAJalwChK
	UQI7JBv1cRiWNlryCw9EcHteciEtlgIayzEQp8Lwwb5ELFaGcVqP0AaQW93AAn2yK4lYGZhmwV9oF
	u5vVHvhEw9jqe0cGUjC4Fbfa6BhUMDi9ooyHBgMZEm7KjLp1jTXb9P8ZIJBceWbo09rqwgL+FFCl/
	zVDlqLeIl+LeuUi7PP5w+Elb7P23apWMA/lsukVHhy+JV9JVAHsKDeOsThHEsJQGHqYqYx2mnrpCw
	klxKoODu78ZYrhAync/3C7gIor+VTqP6ZoMSrwtrGbz4CRi620Amv5oDLvmJ5cXdDJEI2j8RnGAvj
	+bYPwADg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpo9K-0000000ChBH-1BMI;
	Fri, 31 Jul 2026 14:23:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpo9H-0000000ChAT-0YY0
	for ath12k@lists.infradead.org;
	Fri, 31 Jul 2026 14:23:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VCIDq9059967
	for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 14:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GF6NjZywMQ/+If4HtsLfht1L4cnQsWslI7k4bzhHTMY=; b=QhkQ158YMD69WB5Q
	v9GHcxWFFsaNfhWXt92PXrIXAbT5T5+LBOz9ss2bkw+AIWU9avMQ1JQr82cgU4iY
	zjgC5cs/Cb4WJhRwFSEKTsl9QLDZHvMiMXMzw0J/SqREe76pXoUiU2JDkOe93mJo
	HA/XD2IumcQl56pyULEYBfY2tNscFUbNG79kNu10g3/VTiWNjPBvSD3xSH/bDUuM
	Mho7K6dApZxjMCA5y3fkd+0o0nrxVzx/6ff/dQt4dX8+T7XM0WiddnnuH6+dQnbc
	WacfVFA6xsfD21oolJxyDABig9rGU4vOgDc17ti1QglRgcXx5j8ksUc8AV8n1Dje
	necsZQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fruk8rj6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 14:23:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so1590004a91.3
        for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 07:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785507821; x=1786112621; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GF6NjZywMQ/+If4HtsLfht1L4cnQsWslI7k4bzhHTMY=;
        b=cLfg5gzv2UXz8Al4rsA75YOTsAUYZA780ZaLCz0LiyFlNA91iZUUlRjiEP61KSlPGe
         lBlpKpXj+2mbATUkdXiTDBfSBzS5skuSs2zJ6mRpyQbxyZFmWPMACO50EspdrLlnRrg0
         UMvD9GAt95aAjc6bRrHjNkDqb0aqneuMT02Kq2Is6NjzpZ9goWgWQ91cSgB+cz+Bc2+Q
         DS5+Pf8S/kwvjdFMSAOyLeJDSR358Ua/DaJi5uFu9hOb+OlXCU+D6P+RZIwwznax+9dY
         V0gMJzqQ4tiEXXfUDXjX0s/yTMs4yi5b+psw1QIhtjlOGSsx4+xLfqYSJPgpFjP2zsMH
         XWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785507821; x=1786112621;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GF6NjZywMQ/+If4HtsLfht1L4cnQsWslI7k4bzhHTMY=;
        b=Tr33fbunNd6jm1S91bXBvFPquvwFMISHATMlF/ZitMjeKsczAuFGgHzbdbz0TBaZTa
         2aDzngTd0EYKsYDSFVHMy6toAnl6LE69IX1LEIs1jazI1Tx1uiG1u7GCTjuE/0qaF9FD
         LThTxWwl8lOm6xH+AF3MoilMHZebdpwd5I3W7PfPIlZKm7oYwpl7NZbmGpLovOs4aNIx
         Hu3LvMOBatcevWeEIwsWmyFqpvoz/tGN5rYrE4eRFX4ezOZCghmjmavfpeYWbVRpKsSM
         /fEaHXUlPXON9G8/jRgEkqej4sSr7mxLu1m6bshkXYPRQRtMH1RyC0Kq5DqIiUbROzNR
         zjxA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4kBNH6l669Hhhcx9YV+J+NBzlblbErsOMNgIsNg6NE2nm0C0+VgQ7KWlenhNYwQ+dVSjnhk8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxSWvbvTXiDJts+yxsCqoXGhlMrMOgnuA3qnCRhX6wCjErxKvCx
	xaBbRuDfdEuFg7ApCBIB7jBfdEtH4ItoPmohgRAnMlrNGojTKVIbns29BxS44MtBnl8TfXG42BD
	4EbiAVWhGJs/QB80XcAUV1Sh+N8s9V2CufNXb6q8w1Y48aYfpMNpae/BNGfnzccfloQSLXJHB
X-Gm-Gg: AR+sD13EFoaHiGgu48Z4LPO1x5lANxn+0BXvUrXOZ586KYR+0sGY3goUBaWYgcSqOnD
	sQFa01BwtlIsDIj2WrYsmxou50MwgKuzAXgii83Yw9sAsU/0rlLQ8x902wfXh2ljoJ2Q5wtvXuo
	gLlk8ujqtHHK8Ry3nT5o8gDqSBX44ywn5leH8U4XYT6Silsk6JOGE1jlQMMudnGNWA7Anaoz27D
	xtlGxhmXw11jtFhb6GEv/ViNwmdcJI1kdIlUc0ODRyGFGFzBSMQmaqFh3qUDTfjcBhl0aJx9HTz
	WC+rAb8Zgnx5nTXA0NFL0fsHl596SmHgzPK9KEf4Y0cFaaRBi3Wb3FH1Ja08ZTR0JFd20HYyJSs
	r0ifF82v2DFzDSA9wRpymscfb6pVpFQf392POLxq8HezBS003wlFaQo8EN2tQ
X-Received: by 2002:a17:90b:3985:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-38fbc4053d7mr118965a91.7.1785507820962;
        Fri, 31 Jul 2026 07:23:40 -0700 (PDT)
X-Received: by 2002:a17:90b:3985:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-38fbc4053d7mr118944a91.7.1785507820489;
        Fri, 31 Jul 2026 07:23:40 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c1casm6890447eec.10.2026.07.31.07.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 07:23:39 -0700 (PDT)
Message-ID: <8d31fbdf-1597-42ea-bfb6-088af96484db@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 07:23:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: fix encrypted EAPOL TX in encap
 offload mode
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, ath12k@lists.infradead.org
References: <20260729171732.668367-1-reshma.rajkumar@oss.qualcomm.com>
 <236fc613-fb51-42fd-8091-d5be48de9572@dd-wrt.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <236fc613-fb51-42fd-8091-d5be48de9572@dd-wrt.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W8sIkxWk c=1 sm=1 tr=0 ts=6a6cafed cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=HQfo7DNYr6aFIcUEh1kA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEwOSBTYWx0ZWRfX9Sbzahd8ffef
 mxaj+el/7pMrzvsNddYYAjnMWrDMdNOWEaz4ZIna4usm6TEQZJi8GyfA2yPsAoP9/o3pNkS6O6y
 znloZp6zABdUCMVEfrZ7YVsNpWI9UwM=
X-Proofpoint-ORIG-GUID: omds3hhJqWmZL6DAw51wR64x7h6H02oe
X-Proofpoint-GUID: omds3hhJqWmZL6DAw51wR64x7h6H02oe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEwOSBTYWx0ZWRfXy6FgdQEZ2GC3
 ULF+ksnQdoMpywBqkQRu6+wBcBDVPPgCMUU4x4xBH5N8Cd3NfMN2NTzp8eylDNQhbIY5v8Y8cC2
 9Okxm5hhYzh2mSq3swaGjQ/5f5pb8MnLIg3144yhiwh6Qf8rXzNHgfppx+MvYHbWabMJDmmwNYY
 J0DIrRlLyUe57iPo5QossQxdkh8fzjeiHn6OVUc4nEmK1S/xm7VFJ3cxX6xzg5g+ARErBBC9nmE
 uoxt6S656LyWnjVnGsmIT0HNm3ru3T6foRp8e6hZ6x/6HpUCYvjVvaQ2zbYFAWMOGyHgWWsU7II
 HxMkYth1g8CvrwwIJUCaQdI9u8npmXhSoL4H2YTEXWZsE9L259Arjxe4d6h/S2478GzABkxdsxO
 yA2Hpow3mshi1ljCCG3cD03ReZoDB10DWxGtIJmbY8DBxkZf1x1xHGZDi0Prz6PYG/GuwMvFZdU
 fbiVx3grVu3e8uPrFLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_072343_290622_40B03B8B 
X-CRM114-Status: GOOD (  11.97  )
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

On 7/30/2026 3:02 AM, Sebastian Gottschall wrote:
> 
> Am 29.07.2026 um 19:17 schrieb Reshma Immaculate Rajkumar:
>> When a vif operates with IEEE80211_OFFLOAD_ENCAP_ENABLED,
>> mac80211 delivers EAPOL frames to ath12k in native-WiFi format.
>>
>> Unencrypted EAPOL frames used during the initial 4-way
>> handshake are already handled through the existing
>> is_diff_encap path. However, EAPOL frames transmitted during
>> GTK rekeying carry ATH12K_SKB_CIPHER_SET and continue through
>> the normal native-WiFi transmit path.
>>
>> Firmware encryption requires RAW frames with cipher-specific IV and ICV
>> fields correctly provisioned in the skb. Passing encrypted EAPOL frames
>> in native-WiFi format results in incorrect IV provisioning, leading to
>> an invalid ICV and frame drop.
>>
>> Fix this by detecting the EAPOL frames that need HW encryption and
>> converting them to firmware-encrypted RAW frames before transmission.
>> Reserve IV space after the MAC header, append ICV space at the tail,
>> select the appropriate firmware encryption type and request
>> firmware-side encryption.
>>
>> Introduce ath12k_dp_tx_crypto_iv_len() and ath12k_dp_tx_crypto_icv_len()
>> helpers in the TX path to obtain cipher-specific IV and ICV lengths.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01270-QCAHKSWPL_SILICONZ-1
> you mention WLAN.WBE.1.6-01270-QCAHKSWPL_SILICONZ-1 but this firmware 
> isnt available for public. i tested it with wds frames enabled and still 
> have problems with the current available version (01243)

This has fixed an issue in our testbed, and Reshma verified it with the
upstream firmware as well, so I've asked her to reach out directly to you to
debug your failure.

/jeff

