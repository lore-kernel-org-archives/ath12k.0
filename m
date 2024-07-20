Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA8AC3DA59
	for <ath12k@archiver.kernel.org>; Sat, 20 Jul 2024 00:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=clXVX3iRrUgmpBWITIqpuq4djjeV+gXLcvoemK14LAI=; b=dXliLwJBwh1rMZi5zJLmxsdx2h
	X9pkuf1aM0AlbkF5ZmgJIr8oyGF7nv5m0JFayxJqHsMmqmnqAc7n2yLPXVkE0OwACxDHERFC2CLTz
	4uTyYZjYytFs1AuygtErrgz4owzewGxFVZm847X8pR8VNAi6KCOMVm+5shFHDiIlAP/dbv5wHVC65
	90d5Xh7IApb/7u6Sxc+FXms5gWOOT5oCOKs6J4yPq5NASOwR4EfUSEMiBe77aF/Muo60k8mS+3WWe
	D20qwXhlxsJzAgoSuBv8lRbOrjWZkdiFys+aRFFbmH0DLrWbRN+fjOPJEtCxLYQwITdkEiV5zHqK6
	gO/F2BPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUyQD-00000004BhN-4C0P
	for ath12k@archiver.kernel.org;
	Sat, 20 Jul 2024 00:58:02 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUyQB-00000004Bgn-1pdK
	for ath12k@lists.infradead.org;
	Sat, 20 Jul 2024 00:58:00 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-708e75d8d7cso1439177a34.3
        for <ath12k@lists.infradead.org>; Fri, 19 Jul 2024 17:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721437078; x=1722041878; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=clXVX3iRrUgmpBWITIqpuq4djjeV+gXLcvoemK14LAI=;
        b=CewJldbtXdEN23/fHTxuhK+lwupkUUpRslo4lsFTmHJrJp0G5FwOVfi6oGFUA0+l+9
         l6CeEPC5dP+ceZJA4DG4oc1NtBbmnhkiqk2F7OrlceIkmC6SvvmNUvcBBdfpmin2NSrX
         slbV1eQEdBIGmiXNYhpC/RAQSJPPgIFt6LrKmLT0mfpskovS+TGubTJkmD9o31HRb5xN
         PWfiykg4TzeUynWI/r13BwYPCLK172kkIZ4vhGSEzFMXUhON3SGF9AEnYYhkmsdDq36w
         +SLwWAcnUzUiVAS49cvbuSbPXjxEekAoUEdCVBgr4fAFVMPlDN68oBqTdVYDcmedKuw1
         TouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721437078; x=1722041878;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=clXVX3iRrUgmpBWITIqpuq4djjeV+gXLcvoemK14LAI=;
        b=FCrF50fR2avtcwMw5W3qEiFSgkWqwuNm1MwWeSQhxpHII1DhVDH5IBOLrIyNo6w6Xm
         tLrXx4Xx5WXVwcj5kvgBLTS7ET/pdzUxxdjgfhvRMEP5a4DJDFd8w6rOtNpW/ZF7Re5v
         QS9QJbOkL9uIc+GS+PuxaV49vs+5Jpni+865TWguSxM0TU66Wc+MfaU1R52iu7CDMXMV
         lbsEzjS8HSRv9pbyx7zF7OVHgHgUYBDl3MmlyyASsmgpd3e/OgN33bASzIQLdtkm5TDB
         YIV63i0IdXNxkwZKMMNe2XZf5xmM+XXQji5S/tyLB3e7RPxPFlGNe7daRUx/+n05irpf
         0/mg==
X-Gm-Message-State: AOJu0YyX5XPbTsIahTU7kSdxmL20+Osl447cQRrrlz/l//k5UBY1xRUr
	2/aL9aVp146nJ6i6Sx4a0F6NFFfpuI8VR4elBcjCRvEbKBNNwB3b61DYdCJCILBMAgLuBGUgTYR
	O
X-Google-Smtp-Source: AGHT+IFUbLhsU5mNixm6SCZ8yL6i1DsmUfyQs3KBq/6PhYljCrif6Gc4f71sFjqxb0i+3WU/aRLREw==
X-Received: by 2002:a05:6830:6702:b0:702:2550:4e31 with SMTP id 46e09a7af769-70900977a7emr277066a34.29.1721437078214;
        Fri, 19 Jul 2024 17:57:58 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:739a:b665:7f57:d340])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-708f6172fadsm540529a34.57.2024.07.19.17.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 17:57:57 -0700 (PDT)
Date: Fri, 19 Jul 2024 19:57:49 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath12k@lists.infradead.org
Subject: [bug report] wifi: ath12k: add basic WoW functionalities
Message-ID: <d4975b95-9c43-45af-a0ab-80253f18c7f2@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_175759_680326_85BE4F30 
X-CRM114-Status: UNSURE (   5.71  )
X-CRM114-Notice: Please train this message.
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

Hello Baochen Qiang,

Commit 4a3c212eee0e ("wifi: ath12k: add basic WoW functionalities")
from Jun 19, 2024 (linux-next), leads to the following Smatch static
checker warning:

	drivers/net/wireless/ath/ath12k/wow.c:434 ath12k_wow_vif_set_wakeups()
	warn: reusing outside iterator: 'i'

drivers/net/wireless/ath/ath12k/wow.c
    411         default:
    412                 break;
    413         }
    414 
    415         for (i = 0; i < wowlan->n_patterns; i++) {
                            ^^^^^^^^^^^^^^^^^^^^^^
Here we loop until ->n_patterns

    416                 const struct cfg80211_pkt_pattern *eth_pattern = &patterns[i];
    417                 struct ath12k_pkt_pattern new_pattern = {};
    418 
    419                 if (WARN_ON(eth_pattern->pattern_len > WOW_MAX_PATTERN_SIZE))
    420                         return -EINVAL;
    421 
    422                 if (ar->ab->wow.wmi_conf_rx_decap_mode ==
    423                     ATH12K_HW_TXRX_NATIVE_WIFI) {
    424                         ath12k_wow_convert_8023_to_80211(ar, eth_pattern,
    425                                                          &new_pattern);
    426 
    427                         if (WARN_ON(new_pattern.pattern_len > WOW_MAX_PATTERN_SIZE))
    428                                 return -EINVAL;
    429                 } else {
    430                         memcpy(new_pattern.pattern, eth_pattern->pattern,
    431                                eth_pattern->pattern_len);
    432 
    433                         /* convert bitmask to bytemask */
--> 434                         for (i = 0; i < eth_pattern->pattern_len; i++)
    435                                 if (eth_pattern->mask[i / 8] & BIT(i % 8))
    436                                         new_pattern.bytemask[i] = 0xff;

This loop re-uses i and the loop ends with i == eth_pattern->pattern_len.
This looks like a bug.

    437 
    438                         new_pattern.pattern_len = eth_pattern->pattern_len;
    439                         new_pattern.pkt_offset = eth_pattern->pkt_offset;
    440                 }
    441 
    442                 ret = ath12k_wmi_wow_add_pattern(ar, arvif->vdev_id,
    443                                                  pattern_id,
    444                                                  new_pattern.pattern,
    445                                                  new_pattern.bytemask,
    446                                                  new_pattern.pattern_len,
    447                                                  new_pattern.pkt_offset);
    448                 if (ret) {
    449                         ath12k_warn(ar->ab, "failed to add pattern %i to vdev %i: %d\n",
    450                                     pattern_id,
    451                                     arvif->vdev_id, ret);
    452                         return ret;
    453                 }
    454 
    455                 pattern_id++;
    456                 __set_bit(WOW_PATTERN_MATCH_EVENT, &wow_mask);
    457         }
    458 
    459         for (i = 0; i < WOW_EVENT_MAX; i++) {

regards,
dan carpenter

