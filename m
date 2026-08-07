Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB15FC5AC67
	for <ath12k@archiver.kernel.org>; Fri,  7 Aug 2026 02:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mz00fYtOpYKyQvarXkn0NFY+QnXh7H87jp8eyuTRQGA=; b=S9J0t8PMfiDXbhYlNoRJuGPLBl
	0hVLhmIFSSfQdTOtsSjxIo+IkNCKmQbYSymCDdjZlCKcFrWoOZuVcTAIynVEletgwS1VtO+lAgOQI
	5+5piXx6Va5loiUxY6jr5ontn5DAib0/MH34eo5uWa26MowSoBsd6d7w2/3YX5wwmE+gp6oxzhxd+
	8xHh+PGM2OHHwzqynps031aqtDSnBZ7rJzjMoCN7Qt/+y0wCtCH1JFYQi9srTDgN51iuN5ZbVbY+N
	msZuzwN7ZLBTC4Z2myL1hKxR1fyTuXGN9q9rmb8kutHfVpPCtHWxWthY3TgHPNBspQWn6sc02cPP5
	Mg2dhClA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsA6f-00000006xqM-3M7h;
	Fri, 07 Aug 2026 02:14:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsA6c-00000006xog-3K8W
	for ath12k@lists.infradead.org;
	Fri, 07 Aug 2026 02:14:43 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770GjNI3564350
	for <ath12k@lists.infradead.org>; Fri, 7 Aug 2026 02:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mz00fYtOpYKyQvarXkn0NFY+QnXh7H87jp8eyuTRQGA=; b=IemFt93BQHdj5y8L
	NMoKbGZJkHVy2l5XqAaQ41/oq/uWtZmnZNSMFS/+AwzAm7/TrlmmxEgHrBV5geBI
	A9xC78Zs80JswAnJDjafb5z4zxeNKykZaA6NTa4BNqLrXgDNkbLkFGrPjnbytjxC
	QaF3le4QaAyflf/I2yWezZddO3MHzULITWWX3HJ2ns9vzZeISYhj8BHiDZkxO3X1
	DkUb9pwTv1mKB8juku9dn3FMAyJM6z+vrePV4QHq5C9pzbWJXLQiKKzeWD85Zci9
	tXkrKxnNxc3xJNq1VwzcA4/kiDt+XF+ctGwhL7zzzZ4b2M6dlmZqM60XGUgjqzfK
	bzkV5w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jsp0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 07 Aug 2026 02:14:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so3031783a91.1
        for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 19:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786068881; x=1786673681; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mz00fYtOpYKyQvarXkn0NFY+QnXh7H87jp8eyuTRQGA=;
        b=MUvhZGawPlzqRmm1Aq0PljMx02CVfZ4qer9OaKdGKoQWWVYm0LamSAmRf0eqNBz7uV
         VOif7Wa0MWAvOai6Rsj4oeH9YynYLc3QK9nMgzasLwvWUx7f2OrsxiXTLb5FhnLruYc5
         Wrin/ya8FHS1d0QISm5qkdXGhTK2ixrTCC3Ua2I0L9sn+KwnsSnjk3oN0tFRyAOFQG+q
         Vvakq6mrdt2UceGNkF7k+NQJ0fXcyYjc/s4l70oiBEPh2QQEvHw2aaZ2HkIA/0rME/DG
         nEHAOWDBWRikoHwAd/50Uy1oGyDbemVAw8mjjghcUhsf7CZRuVzx8cLsALAoE6wlaIBx
         YRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786068881; x=1786673681;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mz00fYtOpYKyQvarXkn0NFY+QnXh7H87jp8eyuTRQGA=;
        b=ZTp3WmvAiHXCpDqFap4QDuLC4a3iyz5mTIcfZ0Rkci7ZW6jbHyCsf8Vmbvorc33IDf
         pVWD+hgR6nubVeXpJeJ5EomxaD/AJX9qHTBV+YMrpA1kt9oK7iWFsKSCwtqkGkbNVRVg
         E5TKTmLUU8GV4zqtroRcdV3lu3ibCgeNG2aXP3qQeFIWo7nuf+oPqfDRET6/b32+5jxo
         QFdJt/ObXTfTMVyblae2GSXorXEwYEMGyPR/ai8eb4serI9Y7l2Oth0xL7/2DneMEAWn
         fhPoIdlR6Plu15SjiKrOJLI/AxVxKiGRkbR56VaknJ5a0NsFRSiNkF7jMsT716FncsC6
         YNrg==
X-Forwarded-Encrypted: i=1; AHgh+RrIW0S2mWkO1n3PwjRqeEnnFc0bAr2mJ3WKcRENBXf8MTBAzlM4Fw7ZpT54oJ94IACb58CUq5E=@lists.infradead.org
X-Gm-Message-State: AOJu0YwWGvWN71lk2YktAAqGQaJl4LykhreL0qrBntCCWcf06KnFDXvs
	sp2hoCoL058mqpNc2YoUlvwRllg1NCNs6Jw0V8ZuSsi7KBbqBljfqvQJOro+RluYy9tvncDpMKE
	+M0BiNCgkPEmsRFKNDP9bxKj0XMtDn+xrP9eAGAgOtdJ6Ko4TefBLfY0uet3cVlbO
X-Gm-Gg: AR+sD10DZqa/Ma9UYsCiKHkzDXsMKlCcvJqEyVXmPPwTJREZMJ48vJwQueSCFOsatzC
	Ddqz6i/Ers2RL/53aW7j+N9hz7K3B4IAK3WJHnT8aBjuqN4sd/0OdyjjrXHU83V4OQ1w1qLZzZ1
	WIUiG3plgDbzJzNB6oPO+liprA9g9Pvmz79ZIDGZcENgNjzbzCGv7FuzPdIAd62FL1KXWJYEyH5
	WyGVZlwwGPdwlWuQwqUsfrCDLCw73f/TnmtYLVIWdXt6QPvlrDjDKOCn5Ndm9aF8bp3aomFeIcT
	AlO0V6Ovbrr6X4dpb2BcNxg87DQnVrDizn15XVXWWxsYFI2DjqwAVkltqFsStMBnMYzmyi5pxce
	RneQWjih4ZTQHdN5EJlAd1mQ+WJ4s4trGocrcamcczqytSpplm3Oaf7jFK5Kx
X-Received: by 2002:a17:90a:d443:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-3903c594637mr21790175a91.10.1786068881324;
        Thu, 06 Aug 2026 19:14:41 -0700 (PDT)
X-Received: by 2002:a17:90a:d443:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-3903c594637mr21790135a91.10.1786068880803;
        Thu, 06 Aug 2026 19:14:40 -0700 (PDT)
Received: from [192.168.1.20] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14101a60867sm1838672c88.9.2026.08.06.19.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 19:14:40 -0700 (PDT)
Message-ID: <9dd4f651-3437-467f-9994-93b92a83270f@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 19:14:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 4/8] wifi: ath12k: add device DP stats reset
 support via debugfs
To: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
References: <20260806132427.3704828-1-pardeep.kaur@oss.qualcomm.com>
 <20260806132427.3704828-5-pardeep.kaur@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260806132427.3704828-5-pardeep.kaur@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Rt/16imK c=1 sm=1 tr=0 ts=6a753f92 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Ckv83GLBvhiTrphEyGAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDAxMiBTYWx0ZWRfX8rEemFOwifD/
 fl28WV8SIRz67MOpmzmOiWg3sc525KRa5TdFaupyN2f9eQzyr7NWe+Z/8Nn604DJZgFFrsXqxbG
 +2vDRwy6xu/WkFDdqQyvvkflF2PCvFlDdXrVX5CrMogX74nuNbu8jygA1kLD2XQFWe1GXtwRJ3b
 7DwTB+nejI4xlVSG2mZVlkvQrpdhui7CJzNDp7SEBYavHBpqYecDvkBdVKilinGwLtahxQq6SFG
 ZHeatkUNvvwcfleSbciKxocDZC0t2Ne0XEJEQ3nznNzgTQbXVnBqCcR6j21XSilbqEiTGjLkopI
 4Aik+cbz0pIwMYJXPRZrqnparuxqeVSMImKbX3k89CKkTUE/3qLw2oXjaS8qoZMQgngtzVHFOb2
 hA3MPEYJK+q6vL6DUqLn9b/YLo6CVoFFKJkX+ghngI8C0QjuY6rFSDkaFVb1EcMqtsMbc7BmUQd
 8X8xy5uC7isfl/mlAiQ==
X-Proofpoint-GUID: cEmQ_vCgTquNTURmpJaN4OnZbnB0yzW2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDAxMiBTYWx0ZWRfXxBBk0vpSESZy
 J5ohLsjdQzcMMWAkcSoi4alUvO9dwyEwhTVE8GOFIWwOBVkXgVd+4eySm5j1aDCSKo0Tu8aJnSC
 Ca2wtAlOLb2TB4ygGc3CugmCAx/X6mI=
X-Proofpoint-ORIG-GUID: cEmQ_vCgTquNTURmpJaN4OnZbnB0yzW2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_191442_842466_9634F8B3 
X-CRM114-Status: GOOD (  26.11  )
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

On 8/6/2026 6:24 AM, Pardeep Kaur wrote:
> From: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
> 
> There is no way to reset device DP stats counters without reloading
> the driver, making it difficult to isolate issues to a specific time
> window during debugging.
> 
> Add a write handler to the device_dp_stats debugfs file so that
> writing 'reset' clears all device DP stats counters. Change the file
> mode from 0400 to 0600 to allow write access. Use strcmp() with
> newline stripping to match the input, consistent with the existing
> pattern in debugfs.c. Return -EINVAL on unrecognised input.
> 
> No lock is taken around the memset since the counters are updated
> locklessly in the datapath; taking dp_lock would be misleading as it
> does not protect device_stats updates.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
> Co-developed-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
> Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/debugfs.c | 35 ++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
> index ec49692107a8..0e446a666f4c 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs.c
> @@ -1220,8 +1220,41 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
>  	return ret;
>  }
>  
> +static ssize_t
> +ath12k_debugfs_write_device_dp_stats(struct file *file,
> +				     const char __user *user_buf,
> +				     size_t count, loff_t *ppos)
> +{
> +	struct ath12k_base *ab = file->private_data;
> +	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
> +	struct ath12k_device_dp_stats *device_stats = &dp->device_stats;
> +	char buf[20] = {};
> +	int ret;
> +
> +	if (count >= sizeof(buf))
> +		return -EINVAL;
> +
> +	ret = copy_from_user(buf, user_buf, count);
> +	if (ret)
> +		return -EFAULT;
> +
> +	/* drop the possible '\n' from the end */
> +	if (count > 0 && buf[count - 1] == '\n')
> +		buf[count - 1] = '\0';
> +

my review agent says:
The new ath12k_debugfs_write_device_dp_stats uses raw copy_from_user(buf,
user_buf, count) and never checks or advances *ppos. A write split across two
write(2) calls (non-zero ppos on the second) will copy the second chunk into
buf[0] instead of buf[ppos], silently failing to match "reset". The existing
ath12k_write_simulate_fw_crash in the same file (line 63) uses
simple_write_to_buffer(), which is the idiomatic kernel pattern here. Replace
with:
ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf, count);
if (ret <= 0)
    return ret;


> +	if (!strcmp(buf, "reset")) {
> +		memset(device_stats, 0, sizeof(*device_stats));
> +		return count;
> +	}
> +
> +	ath12k_warn(ab, "unsupported command: %s\n", buf);
> +
> +	return -EINVAL;
> +}
> +
>  static const struct file_operations fops_device_dp_stats = {
>  	.read = ath12k_debugfs_dump_device_dp_stats,
> +	.write = ath12k_debugfs_write_device_dp_stats,
>  	.open = simple_open,
>  	.owner = THIS_MODULE,
>  	.llseek = default_llseek,
> @@ -1232,7 +1265,7 @@ void ath12k_debugfs_pdev_create(struct ath12k_base *ab)
>  	debugfs_create_file("simulate_fw_crash", 0600, ab->debugfs_soc, ab,
>  			    &fops_simulate_fw_crash);
>  
> -	debugfs_create_file("device_dp_stats", 0400, ab->debugfs_soc, ab,
> +	debugfs_create_file("device_dp_stats", 0600, ab->debugfs_soc, ab,
>  			    &fops_device_dp_stats);
>  }
>  


