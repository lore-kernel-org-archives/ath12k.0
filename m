Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1FEC83030
	for <ath12k@archiver.kernel.org>; Tue,  1 Jul 2025 02:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHtKxWM11+Z22kidvQGi6Fw1MG9JX6Dkd9yt+AT+dMo=; b=vdZiCNdItxLGUQCr20WMjfmrBO
	J0Ix1I23oSdGZVsi+RvcawF8fB0LcxXIGF/PzweMoLzvuJJ5JQQRjmORWsm4Jr/u5qLffW/sFBTpg
	rSkSWLJMszB34UYrvYw5KYkOZLzQq1v7cUawWA8r7ml9i6ZW9TKz8gy3hkpao/DXLOmDyD9cQTc5N
	VHNDOFuv4XY1xkFux0Ku9TvJstKg4KhfBbyyC4iZjDh0hIDS8HqrHKNDBNmEfjkESeotIX2XhShaU
	IVqqi/xkK0fd2Gml97vYlv3/0zGh7l0wyYQJ0Y+jMvMoUnCgNFiIhfkpycK3QUekY5G7uyvlwGVrC
	AVLAM6oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWQVz-00000003rJ9-3mEw;
	Tue, 01 Jul 2025 02:14:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWQVx-00000003rIX-3qcH
	for ath12k@lists.infradead.org;
	Tue, 01 Jul 2025 02:14:31 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UIgXRl031491
	for <ath12k@lists.infradead.org>; Tue, 1 Jul 2025 02:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HHtKxWM11+Z22kidvQGi6Fw1MG9JX6Dkd9yt+AT+dMo=; b=Gmip1stQimUj7a4x
	ILqELKq6zz7Ui9ByPoYeBEEJ5umyeSFpGyeKw3JIp/q0DawFB8r2HERbq80AmSlZ
	RnsEwh5UTT4ytZcu+wOL+6bxpTk6X/2hvpD4PtGnL2KB8EfXdq3GKuW2ACsWbLfG
	/Dv9irFblsHymImHWTjFMwUMdbMcuBxUkkJaZn6DWIDfVYAt9fTsUdd5PlX+otiR
	YpIl8c/9o+iuvKcnQzL54I4LPWr+TVyOh3kQ6p1O+JMTP3cSMpZ/Jz2U1DEtOXCP
	Zv8Go9rZeEJyCQzIM7ycEve2tcs2JJH2HmqA4DuIfES1lWVJAxNzd+7JT7gkBpir
	KWKUQA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47m02v0ujn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 01 Jul 2025 02:14:27 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b31bd4c3359so1642540a12.3
        for <ath12k@lists.infradead.org>; Mon, 30 Jun 2025 19:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751336067; x=1751940867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HHtKxWM11+Z22kidvQGi6Fw1MG9JX6Dkd9yt+AT+dMo=;
        b=OtkHvAHV9v3IVQtInEFx4zYGMhWFFkIzlI21pLUTejSDo0+mExOqrOOT1loibpgRWP
         3g8qXBAWKw1BAfA+VfQzregXMsW9v4ye96rqzi1pJBWLAkagu9ypP+syGNp98qZ/Nfmv
         1l+D8tHmnwl3wtBAg7YNGwdN3RT608nFi9QPHs9A05dz03Qcdih9y/S4q/Tj7ukL+9AH
         +iPIf09MwvhApG2daRxj5mUO74x+Vy0mJoAie1qSXC8pis7J+F/Fdv8QOBOcYCzabERI
         Kov687BGy4qPGQ17WJL7Wu5Hbdk1pWSVNdKOqSJ8D1zSqKCetXAXAJ36kjvEP5gIh934
         5w/w==
X-Forwarded-Encrypted: i=1; AJvYcCW9fgmjdWmQtEUDmJtQDZ9tnrXn+tpZPBRGbOdqfjvlDurUEaZi/Ej2INM5TYeECi23b7Fufrs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7TlLjikuV0Z1V5nmMWV9YiFlHCB4gCfyGUMmrWC4w77I3OBWa
	cYU8fDx3bEeVBxAwLAvgXHp/DgHiAVFP4QBunSoZAKlTrWQh3AJbvYblAVepfNfM8XcO0UkrFFJ
	OlyJJbaH+6Vcb74L9ilXRbEfsVryQsqeiQ8PstrVNqt+vZOLiU+nuCR+AnGHj+bhT
X-Gm-Gg: ASbGnctWv2K5xRVUlIn6RNxNSFM5hKTmDEQwyX+fs+ARc7RmR4pyh9mTbqqRRH8U97b
	5NtqRE46r8jR/p24fKZ0XomIvjd1ph7Q687kzMcLa7+Ky+RC40brq3x1tulmzfutty01tXY0KpG
	vA582xGiPiphMUVc8lDQ6EWYcFwKiBnM1hZem86OqXWYcV78cfB7xZrjD2rF7gV1sW+eTdULFlB
	tD3NFBOMzlbhjFctSK9BGlCWomQ1RImY/IY5DvBXM4jK0KdnuOcQeRRh+LUqCGPlX959HJgmtZY
	HjwxcrvAJlR2dJsMEqdGLZzqw1RxzTU6PiJ/yH532hBg8yddaaCmr+zMYD8GuMrucMXfAkfElxK
	PgCRARPpJ
X-Received: by 2002:a17:903:22cb:b0:234:b41e:37a4 with SMTP id d9443c01a7336-23ac3dec2damr203708025ad.6.1751336066818;
        Mon, 30 Jun 2025 19:14:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEah756PkrXyZjdLbRVeC6taDGb8DFPvCLCg1nYwqQmUmacq7NGEn8t2UNmihcTj9KqCH7Idw==
X-Received: by 2002:a17:903:22cb:b0:234:b41e:37a4 with SMTP id d9443c01a7336-23ac3dec2damr203707805ad.6.1751336066327;
        Mon, 30 Jun 2025 19:14:26 -0700 (PDT)
Received: from [10.133.33.126] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b0052sm93404815ad.158.2025.06.30.19.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 19:14:26 -0700 (PDT)
Message-ID: <ac2398f4-4720-4e15-bf8c-c588c7315960@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 10:14:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next V15 5/9] wifi: ath12k: fix TX and RX MCS rate
 configurations in HE mode
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Baochen Qiang <quic_bqiang@quicinc.com>
References: <20250701010408.1257201-1-quic_pradeepc@quicinc.com>
 <20250701010408.1257201-6-quic_pradeepc@quicinc.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20250701010408.1257201-6-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDAwNiBTYWx0ZWRfX+2qnJCtMPMWp
 gjBF/psmUG3CmCacgmQCBaLS/uuHq6mWjKxcYXVdIglUtVcNbHdDDTfid635VG9PWDKUVo4BHa+
 SJFK1cW7gFym04GgXCfy1b20S/Cv0F9KlE3NVbAGcUvPoYGZi3H40ew1IIADpb20XgksPBswpcJ
 izgicm0dyMEL/vwvThDLgadqUiT8CIxZdmXt2s6Fq9SB2A3YqbH4DObD0/Gb6EQNFedJzvYFfMD
 c/Ypwn5vPccbWALbharPxANUXrkOUXdzslK3hZwBQOOiwuzz9Khs0A8BZay4fD7cDqrcZcpbr8u
 X1Hrmn+dMrc+/hSkzNyAlFoYf7HleQsrrrU9ERa4Bd1YeIUOX67MYap3nDSWw9L8doD3KAlRTTI
 GpwwRFaNvGrS2tLLAyT7H8KS8JpeBF1owNJtcr8DHoDrb0a5ID24kuSppzEKzjlLXBI5udeq
X-Authority-Analysis: v=2.4 cv=Y8L4sgeN c=1 sm=1 tr=0 ts=68634483 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=Un5vsAVSn38TPk-1xuEA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: IcdQK6mhjTqqotwKppqDS41J6KI1SceP
X-Proofpoint-ORIG-GUID: IcdQK6mhjTqqotwKppqDS41J6KI1SceP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0
 mlxscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_191429_971654_88DA4F07 
X-CRM114-Status: GOOD (  21.15  )
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



On 7/1/2025 9:04 AM, Pradeep Kumar Chitrapu wrote:
> Currently, the TX and RX MCS rate configurations per peer are
> reversed when sent to the firmware. As a result, RX MCS rates
> are configured for TX, and vice versa. This commit rectifies
> the configuration to match what the firmware expects.

Please mention that you are rectifying only for AP mode. For STA, current code is good.

> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

I don't see the need to add my S-O-B here, better drop it.

> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/wmi.c | 19 +++++++++++++++++--
>  drivers/net/wireless/ath/ath12k/wmi.h |  2 ++
>  2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 6c6354b3e18e..cdf3406302ee 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -2183,6 +2183,8 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
>  				   struct ath12k_wmi_peer_assoc_arg *arg)
>  {
>  	struct ath12k_wmi_pdev *wmi = ar->wmi;
> +	struct ath12k_base *ab = ar->ab;
> +	struct ath12k_link_vif *arvif;
>  	struct wmi_peer_assoc_complete_cmd *cmd;
>  	struct ath12k_wmi_vht_rate_set_params *mcs;
>  	struct ath12k_wmi_he_rate_set_params *he_mcs;
> @@ -2198,6 +2200,13 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
>  	u16 eml_cap;
>  	__le32 v;
>  
> +	arvif = ath12k_mac_get_arvif(ar, arg->vdev_id);
> +	if (!arvif) {
> +		ath12k_warn(ab, "failed to find arvif with vdev id %d\n",
> +			    arg->vdev_id);
> +		return -EINVAL;
> +	}
> +
>  	peer_legacy_rates_align = roundup(arg->peer_legacy_rates.num_rates,
>  					  sizeof(u32));
>  	peer_ht_rates_align = roundup(arg->peer_ht_rates.num_rates,
> @@ -2333,8 +2342,14 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
>  		he_mcs->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_HE_RATE_SET,
>  							    sizeof(*he_mcs));
>  
> -		he_mcs->rx_mcs_set = cpu_to_le32(arg->peer_he_rx_mcs_set[i]);
> -		he_mcs->tx_mcs_set = cpu_to_le32(arg->peer_he_tx_mcs_set[i]);
> +		if (arvif->ahvif->vdev_type == WMI_VDEV_TYPE_STA) {
> +			he_mcs->rx_mcs_set = cpu_to_le32(arg->peer_he_rx_mcs_set[i]);
> +			he_mcs->tx_mcs_set = cpu_to_le32(arg->peer_he_tx_mcs_set[i]);
> +
> +		} else {
> +			he_mcs->rx_mcs_set = cpu_to_le32(arg->peer_he_tx_mcs_set[i]);
> +			he_mcs->tx_mcs_set = cpu_to_le32(arg->peer_he_rx_mcs_set[i]);
> +		}
>  		ptr += sizeof(*he_mcs);
>  	}
>  
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
> index 0964ca03069a..7ad84624600d 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.h
> +++ b/drivers/net/wireless/ath/ath12k/wmi.h
> @@ -4162,7 +4162,9 @@ struct ath12k_wmi_vht_rate_set_params {
>  
>  struct ath12k_wmi_he_rate_set_params {
>  	__le32 tlv_header;
> +	/* MCS at which the peer can receive */
>  	__le32 rx_mcs_set;
> +	/* MCS at which the peer can transmit */
>  	__le32 tx_mcs_set;
>  } __packed;
>  


